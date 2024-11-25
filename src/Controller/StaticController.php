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
            $this->logger->debug('>>> >>> >>> *** *** *** *** *** *** module getUsername: ' . $user->getUsername());
        }
        $debug_session = "Pass variable to check";
        

        $content = $twig->render('Static/module.html.twig', ['debug' => $debug_session,
                                                                'amiconnected' => ConnectionManager::amIConnectedOrNot(),
                                                                'scale_right' => ConnectionManager::whatScaleRight()]);

        return new Response($content);
    }

    public function partner(Environment $twig, LoggerInterface $logger)
    {
        /**
         * @var User
         */
        $user = $this->getUser();
        if ($user) { 
            // L'utilisateur est connecté
            $this->logger->debug('>>> >>> >>> *** *** *** *** *** *** partner getUsername: ' . $user->getUsername());
        }
        $debug_session = "Pass variable to check";
        

        $content = $twig->render('Static/partner.html.twig', ['debug' => $debug_session,
                                                                'amiconnected' => ConnectionManager::amIConnectedOrNot(),
                                                                'scale_right' => ConnectionManager::whatScaleRight()]);

        return new Response($content);
    }

    public function secondaire(Environment $twig, LoggerInterface $logger)
    {
        /**
         * @var User
         */
        $user = $this->getUser();
        if ($user) { 
            // L'utilisateur est connecté
            $this->logger->debug('>>> >>> >>> *** *** *** *** *** *** partner getUsername: ' . $user->getUsername());
        }
        $debug_session = "Pass variable to check";
        

        $content = $twig->render('Static/mockup.html.twig', ['debug' => $debug_session,
                                                                'amiconnected' => ConnectionManager::amIConnectedOrNot(),
                                                                'scale_right' => ConnectionManager::whatScaleRight()]);

        return new Response($content);
    }

    public function superieur(Environment $twig, LoggerInterface $logger)
    {
        /**
         * @var User
         */
        $user = $this->getUser();
        if ($user) { 
            // L'utilisateur est connecté
            $this->logger->debug('>>> >>> >>> *** *** *** *** *** *** partner getUsername: ' . $user->getUsername());
        }
        $debug_session = "Pass variable to check";
        

        $content = $twig->render('Static/mockup.html.twig', ['debug' => $debug_session,
                                                                'amiconnected' => ConnectionManager::amIConnectedOrNot(),
                                                                'scale_right' => ConnectionManager::whatScaleRight()]);

        return new Response($content);
    }

    public function startover(Environment $twig, LoggerInterface $logger)
    {
        /**
         * @var User
         */
        $user = $this->getUser();
        if ($user) { 
            // L'utilisateur est connecté
            $this->logger->debug('>>> >>> >>> *** *** *** *** *** *** startover getUsername: ' . $user->getUsername());
        }
        $debug_session = "Pass variable to check";
        

        $content = $twig->render('Static/startover.html.twig', ['debug' => $debug_session,
                                                                'amiconnected' => ConnectionManager::amIConnectedOrNot(),
                                                                'scale_right' => ConnectionManager::whatScaleRight()]);

        return new Response($content);
    }


    public function calendar(Environment $twig, LoggerInterface $logger)
    {
      // Be carefull if you have array of array
      $dbconnectioninst = DBConnectionManager::getInstance();
      //$result = $dbconnectioninst->query('select answera from myquery;')->fetch(PDO::FETCH_ASSOC);
      $query_get_calendar = " SELECT id, calendar, display_date AS DISP_DATE, fEscapeStr(display_info) AS DISP_INFO, fEscapeStr(observation) AS OBSERVATION, DATE_FORMAT(create_date, '%d/%m/%Y %Hh%m') AS CREATE_DATE FROM uac_calendar WHERE is_displayed = 'Y' ORDER BY tech_start_date ASC; ";
      $logger->debug("Query query_get_calendar: " . $query_get_calendar);
  
      $result_query_get_calendar = $dbconnectioninst->query($query_get_calendar)->fetchAll(PDO::FETCH_ASSOC);
  
  
      $content = $twig->render('Static/calendar.html.twig', ['amiconnected' => ConnectionManager::amIConnectedOrNot(),
                                                                    'result_query_get_calendar' => $result_query_get_calendar,
                                                                    'scale_right' => ConnectionManager::whatScaleRight()]);
  
      return new Response($content);
    }
}