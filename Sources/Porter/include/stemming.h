//
//  stemming.h
//  PorterStemmer
//
//  Created by Vincent Coetzee on 2017/01/26.
//
//

#ifndef stemming_h
#define stemming_h

struct stemmer;

extern struct stemmer * create_stemmer(void);
extern void free_stemmer(struct stemmer * z);

extern int stem(struct stemmer * z, char * b, int k);

#endif /* stemming_h */
