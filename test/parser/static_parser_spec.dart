import '../_specs.dart';

var FUNCTIONS = { '1': 1 };

class AlwaysReturnX implements DynamicParser {
  call(String x) => 'x';
}

main() {
  describe('static parser', () {
    beforeEach(module((AngularModule m) {
      m.type(Parser, implementedBy: StaticParser);
      m.type(DynamicParser, implementedBy: AlwaysReturnX);
      m.value(StaticParserFunctions, new StaticParserFunctions(FUNCTIONS));
    }));


    it('should run a static function', inject((Parser parser) {
      expect(parser('1')).toEqual(1);
    }));


    it('should call the fallback if there is not function', inject((Parser parser) {
      expect(parser('not 1')).toEqual('x');
    }));
  });
}
