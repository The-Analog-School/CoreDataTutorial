// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Album.h instead.

#import <CoreData/CoreData.h>


extern const struct AlbumAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *releaseDate;
} AlbumAttributes;

extern const struct AlbumRelationships {
	__unsafe_unretained NSString *artist;
	__unsafe_unretained NSString *tracks;
} AlbumRelationships;

extern const struct AlbumFetchedProperties {
} AlbumFetchedProperties;

@class Artist;
@class Track;




@interface AlbumID : NSManagedObjectID {}
@end

@interface _Album : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AlbumID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* releaseDate;



//- (BOOL)validateReleaseDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Artist *artist;

//- (BOOL)validateArtist:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSOrderedSet *tracks;

- (NSMutableOrderedSet*)tracksSet;





@end

@interface _Album (CoreDataGeneratedAccessors)

- (void)addTracks:(NSOrderedSet*)value_;
- (void)removeTracks:(NSOrderedSet*)value_;
- (void)addTracksObject:(Track*)value_;
- (void)removeTracksObject:(Track*)value_;

@end

@interface _Album (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSDate*)primitiveReleaseDate;
- (void)setPrimitiveReleaseDate:(NSDate*)value;





- (Artist*)primitiveArtist;
- (void)setPrimitiveArtist:(Artist*)value;



- (NSMutableOrderedSet*)primitiveTracks;
- (void)setPrimitiveTracks:(NSMutableOrderedSet*)value;


@end
