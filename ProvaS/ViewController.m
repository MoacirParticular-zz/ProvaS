//
//  ViewController.m
//  ProvaS
//
//  Created by Moacir Lamego on 06/01/19.
//  Copyright © 2019 mobilesapp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tabela, navBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    navBar.topItem.title = @"Repositórios Públicos Java do GitHub";
    
    // o Ideal seria criar os objetos para criar as responsabilidades de cada um, porem para ser arpido foi assim mesmo.
    NSString *url = @"https://api.github.com/search/repositories?q=language:Java&sort=stars)";
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError* error;
    NSDictionary *resultados = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    // capturar a tag items que contem a lista solicitada
    arrayLocal = [resultados objectForKey:@"items"];
    
    [tabela reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayLocal.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Utilizando celula padrao, modelo basico.
    UITableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:@"idCelulaListaRepositorios" forIndexPath:indexPath];
    
    // Pegando os dados do array de leitura para transpor para a celula.
    NSMutableDictionary *dic = [arrayLocal objectAtIndex:indexPath.row];
    
    // pegando a tag name da lista solicitada.
    
    celula.textLabel.text = [[NSString alloc] initWithFormat:@"%@", [[dic objectForKey:@"owner"] objectForKey:@"login"]];
    
    celula.detailTextLabel.text = [[NSString alloc] initWithFormat:@"%@", [dic objectForKey:@"name"]];
    
    return celula;
}

-(void)backPressed: (id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Ao clicar na celula
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // abrindo nova view com os detalhes do item selecionado.
    DetailViewController *detailVC = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"idDetailViewController"];
    [detailVC setModalTransitionStyle:2];
    
    // Botão para voltar
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:detailVC];

    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Voltar" style:UIBarButtonItemStyleDone target:nil action:@selector(backPressed:)];
    
    detailVC.navigationItem.leftBarButtonItem = backButton;
    
    
    
    
    NSMutableDictionary* teste = [arrayLocal objectAtIndex:indexPath.row];
    [detailVC buscaDados:[teste objectForKey:@"name"] and:[[teste objectForKey:@"owner"] objectForKey:@"login"]];
    
    [self presentViewController:navController animated:YES completion:^{
        
    }];
    
    
    
    
    // para desmarcar a celula selecionada
    [tabela deselectRowAtIndexPath:indexPath animated:YES];
}


@end

