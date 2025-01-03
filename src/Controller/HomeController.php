<?php
// src/Controller/HomeController.php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\DBUtils\ConnectionManager;
use Psr\Log\LoggerInterface;
use Twig\Environment;

class HomeController extends AbstractController
{
  public function index(Environment $twig, LoggerInterface $logger)
  {

    $content = $twig->render(
                        'Home/home.html.twig');
    return new Response($content);
  }
}