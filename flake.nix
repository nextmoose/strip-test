  {
    inputs =
      {
        flake-utils.url = "github:numtide/flake-utils?rev=5aed5285a952e0b949eb3ba02c12fa4fcfef535f" ;
        nixpkgs.url = "github:nixos/nixpkgs?rev=57eac89459226f3ec743ffa6bbbc1042f5836843" ;
      } ;
    outputs =
      { flake-utils , self , nixpkgs } :
        flake-utils.lib.eachDefaultSystem
          (
            system :
              {
                lib =
                  {
                    bool = tester : tester ( implementation : implementation false ) false null ;
                    float = tester : tester ( implementation : implementation 0.0 ) false null ;
                    happy = tester : tester ( implementation : implementation "HAPPY" ) true "HAPPY" ;
                    int = tester : tester ( implementation : implementation 0 ) false null ;
                    lambda = tester : tester ( implementation : implementation ( x : x ) false null ) ;
                    list = tester : tester ( implementation : implementation [ ] false null ) ;
                    null = tester : tester ( implementation : implementation null ) false null ;
                    path = tester : tester ( implementation : implementation ./flake.nix ) false null ;
                    set = tester : tester ( implementation : implementation { } ) false null ;
                    string =
                      {
		        blank = tester : tester ( implementation : implementation "" ) true "" ;
                        post = tester : tester ( implementation : implementation "HAPPY " ) true "HAPPY" ;
                        pre = tester : tester ( implementation : implementation " HAPPY" ) true "HAPPY" ;
                      } ;                   
                  } ;
              }
          ) ;
  }
