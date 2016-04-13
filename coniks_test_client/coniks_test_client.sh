#!/bin/bash

#  Copyright (c) 2015, Princeton University.
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are 
#  met:
#  * Redistributions of source code must retain the above copyright 
#  notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above 
#  copyright notice, this list of conditions and the following disclaimer 
#  in the documentation and/or other materials provided with the 
#  distribution.
#  * Neither the name of Princeton University nor the names of its
#  contributors may be used to endorse or promote products derived from
#  this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
#  CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
#  INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
#  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
#  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
#  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
#  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY 
#  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
#  POSSIBILITY OF SUCH DAMAGE.

## Runs or a CONIKS test client instance

# Set all the configs here
CLASS_DEST="bin" #change this if you built the server somewhere else
CLASSPATH="-cp $CLASS_DEST"
CLIENT_BIN="org.coniks.coniks_test_client.TestClient"
CONIKS_CLIENTCONFIG="config"
RUN_CONIKS="java $CLASSPATH $CLIENT_BIN $CONIKS_CLIENTCONFIG"

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <server> [test]"
    exit
fi

SERVER=$1

if [ "$#" = 1 ]; then
    $RUN_CONIKS $SERVER "full"

elif [ "$#" = 2 ]; then
    $RUN_CONIKS $SERVER $2

else
    echo "Usage: $0 <server> [test]"
fi
