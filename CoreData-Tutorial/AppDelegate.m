//
//  AppDelegate.m
//  CoreData-Tutorial
//
//  Created by Christopher Constable on 2/3/14.
//
//

#import "AppDelegate.h"

#import "Artist.h"
#import "Album.h"
#import "Track.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
//    [self create];
//    [self read];
//    [self deleteArtist];
//    NSLog(@"===== AFTER DELETE =====");
//    [self read];
    
    return YES;
}

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

- (NSManagedObjectModel *)managedObjectModel
{
    if (!_managedObjectModel) {
        NSURL *momURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:momURL];
    }
    
    return _managedObjectModel;
}

@end
