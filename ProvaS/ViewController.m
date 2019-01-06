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
@synthesize tabela;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Modelo simples encontrado facilmente com uma pesquisa no google
    
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



@end
