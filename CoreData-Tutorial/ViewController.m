//
//  ViewController.m
//  CoreData-Tutorial
//
//  Created by Christopher Constable on 2/3/14.
//
//

@import CoreData;
#import "ViewController.h"

#import "Artist.h"
#import "Album.h"
#import "Track.h"

@interface ViewController ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (IBAction)createPressed:(id)sender;
- (IBAction)readPressed:(id)sender;
- (IBAction)deletePressed:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CRUD Operations

/**
 *  Creates some models and persists them using Core Data.
 */
- (void)create
{
    // Create Artist
    Artist *johnnyCash = [NSEntityDescription insertNewObjectForEntityForName:@"Artist"
                                                       inManagedObjectContext:self.managedObjectContext];
    johnnyCash.name = @"Johnny Cash";
    
    // Create Album
    Album *album = [NSEntityDescription insertNewObjectForEntityForName:@"Album"
                                                 inManagedObjectContext:self.managedObjectContext];
    album.name = @"Ring of Fire: The Best of Johnny Cash";
    [johnnyCash addAlbumsObject:album];
    
    // Create Tracks
    Track *newTrack;
    for (int i = 1; i < 13; i++) {
        newTrack = [NSEntityDescription insertNewObjectForEntityForName:@"Track"
                                                 inManagedObjectContext:self.managedObjectContext];
        newTrack.name = [NSString stringWithFormat:@"Track %d", i];
        newTrack.album = album;
    }
    
    // Save everything to disk
    [self.managedObjectContext save:nil];
}

/**
 *  Prints the contents of our database.
 */
- (void)read
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Artist"];
    NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest
                                                                error:nil];
    for (Artist *artist in results) {
        NSLog(@"%@", artist.name);
        
        for (Album *album in artist.albums) {
            NSLog(@"\tAlbum: %@", album.name);
            
            for (Track *track in album.tracks) {
                NSLog(@"\t\tTrack: %@", track.name);
            }
        }
    }
}

/**
 *  Removes an object from our database.
 */
- (void)deleteArtist
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Artist"];
    NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest
                                                                error:nil];
    Artist *artist = [results firstObject];
    [self.managedObjectContext deleteObject:artist];
    
    NSError *error;
    [self.managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"Error saving data: %@", error);
    }
}

#pragma mark - Core Data Stack

- (NSManagedObjectContext *)managedObjectContext
{
    if (!_managedObjectContext) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    }
    
    return _managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (!_persistentStoreCoordinator) {
        NSURL *storeURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                  inDomains:NSUserDomainMask] lastObject];
        storeURL = [storeURL URLByAppendingPathComponent:@"data.sqlite"];
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeURL
                                                        options:nil
                                                          error:nil];
    }
    
    return _persistentStoreCoordinator;
}

/**
 * The Managed Object Model is constructed from our schema. It basically holds all
 * the "blueprints" of our models and objects.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (!_managedObjectModel) {
        NSURL *momURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:momURL];
    }
    
    return _managedObjectModel;
}

#pragma mark - Actions

- (IBAction)createPressed:(id)sender {
    [self create];
}

- (IBAction)readPressed:(id)sender {
    [self read];
}

- (IBAction)deletePressed:(id)sender {
    [self deleteArtist];
}

@end
