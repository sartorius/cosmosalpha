<?php
// src/Controller/HomeController.php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Request;
use App\Entity\User;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\DBUtils\MailManager;
use Twig\Environment;
use App\DBUtils\DBConnectionManager;
use App\DBUtils\ConnectionManager;
use Psr\Log\LoggerInterface;
use \PDO;


class StaticController extends AbstractController
{
    private $logger; public function __construct(LoggerInterface $logger) { $this->logger = $logger; }

    public function module(Environment $twig, LoggerInterface $logger)
    {
        /**
         * @var User
         */
        $user = $this->getUser();
        if ($user) { 
            // L'utilisateur est connecté
            $this->logger->debug('>>> >>> >>> *** *** *** *** *** *** Show me getUsername: ' . $user->getUsername());
        }
        $debug_session = "Pass variable to check";
        

        $content = $twig->render('Static/module.html.twig', ['debug' => $debug_session,
                                                                'amiconnected' => ConnectionManager::amIConnectedOrNot(),
                                                                'scale_right' => ConnectionManager::whatScaleRight()]);

        return new Response($content);
    }
}