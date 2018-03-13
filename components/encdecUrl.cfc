component {
    // set-up encryption details
    myKey = 'HIjv4jTHeknV7mY4CFBqdgOv1vWX4i/G9zPrctJjl0c=';
    myAlgorithm = 'AES/CBC/PKCS5Padding';
    myEncoding = 'HEX';

    public string function getFullName (String firstName, String lastName) {

        // parameterize
        param name="URL['v' & hash( 'userId', 'SHA-384', 'UTF-8', 500 )]" default="0";
        param name="URL['v' & hash( 'name', 'SHA-384', 'UTF-8', 1000 )]" default="";
        param name="URL['v' & hash( 'departmentId', 'SHA-384', 'UTF-8', 750 )]" default="0";

        // check for validity of parameter values
        if( URL['v' & hash( 'userId', 'SHA-384', 'UTF-8', 500 )] eq 0 ) {
            // invalid or no user id submitted
        } else if ( !len( URL['v' & hash( 'name', 'SHA-384', 'UTF-8', 1000 )] ) ) {
            // invalid or no name submitted
        } else if ( URL['v' & hash( 'departmentId', 'SHA-384', 'UTF-8', 750 )] eq 0 ) {
            // invalid or no departmentId submitted
        }

        // try to decrypt passed values
        try {

            userId = decrypt( URL['v' & hash( 'userId', 'SHA-384', 'UTF-8', 500 )] , myKey, myAlgorithm, myEncoding );
            name = decrypt( URL['v' & hash( 'name', 'SHA-384', 'UTF-8', 1000 )], myKey, myAlgorithm, myEncoding );
            departmentId = decrypt( URL['v' & hash( 'departmentId', 'SHA-384', 'UTF-8', 750 )], myKey, myAlgorithm, myEncoding );

        } catch( any e ) {
            // deal with decryption errors
        }
    }


}