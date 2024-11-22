<?php

namespace App\Controller;

use Psr\Log\LoggerInterface;
use App\Entity\User;
use App\Form\RegistrationFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class SecurityController extends AbstractController
{
    private $logger; public function __construct(LoggerInterface $logger) { $this->logger = $logger; }
    
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // retrouver une erreur d'authentification s'il y en a une
        $error = $authenticationUtils->getLastAuthenticationError();
        // retrouver le dernier identifiant de connexion utilisé
        $lastUsername = $authenticationUtils->getLastUsername();

        $this->logger->debug('*** *** *** *** *** *** *** *** *** Show me $lastUsername: ' . $lastUsername);

        return $this->render('ADM/Security/login.html.twig', [
            'last_username' => $lastUsername,
            'error' => $error,
            ]
        );
    }

    /**
     * @Route("/logout", name="security_logout")
     */
    public function logout(): void
    {
        throw new \Exception('This should never be reached!');
    }

    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager): Response
    {
        $user = new User();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            /** @var string $plainPassword */
            $plainPassword = $form->get('plainPassword')->getData();
            $this->logger->debug('*** *** *** *** *** *** *** *** *** Show me $plainPassword: ' . $plainPassword . ' > ' . $userPasswordHasher->hashPassword($user, $plainPassword));


            // encode the plain password
            $user->setPassword($userPasswordHasher->hashPassword($user, $plainPassword));
            $user->setRoles(['R_0Z']);

            $entityManager->persist($user);
            $entityManager->flush();

            // do anything else you need here, like send an email

            return $this->redirectToRoute('main');
        }

        return $this->render('ADM/Security/register.html.twig', [
            'registrationForm' => $form,
        ]);
    }
}
