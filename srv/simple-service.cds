using { simple } from '../db/simple';

service SimpleService {

    entity Things as projection on simple.Things 
    actions {
        action actionBound();
        function funcBound() returns String;
    };

    action actionUnbound();
    function func() returns String;

}