#!/usr/bin/env python3

import unittest

class SimpleComplex:
    pass

class Tester(unittest.TestCase):
    def test_default_init(self):
        c1 = SimpleComplex()
        self.assertEqual(c1.a, 0.0)
        self.assertEqual(c1.b, 0.0)

    def test_init_with_nubmers(self):
        c1 = SimpleComplex(1.2, 2.4)

        self.assertEqual(c1.a, 1.2)
        self.assertEqual(c1.b, 2.4)

    def test_getters(self):
        c1 = SimpleComplex(2.2, 1.25)
        self.assertEqual(c1.a, 2.2)
        self.assertEqual(c1.b, 1.25)

    def test_str_default(self):
        c1 = SimpleComplex()
        self.assertEqual(str(c1), "0.0 + 0.0i")

    def test_str(self):
        c1 = SimpleComplex(6.6, 8.0)
        self.assertEqual(str(c1), "6.6 + 8.0i")

    def test_repr(self):
        c1 = SimpleComplex(6.1, 10.0)
        self.assertEqual(c1.__repr__(), "6.1 + 10.0i")

    def test_setters(self):
        c1 = SimpleComplex(2.2, 1.25)
        c1.b = 2.5
        c1.a = 3.4
        self.assertEqual(c1.a, 3.4)
        self.assertEqual(c1.b, 2.5)

    def test_add(self):
        c1 = SimpleComplex(1.2, 2.4)
        c2 = SimpleComplex(1.8, 1.6)

        c3 = c1 + c2
        self.assertEqual(c3.a, 3.0)
        self.assertEqual(c3.b, 4.0)

    def test_mul(self):
        c1 = SimpleComplex(2.6, 3.8)
        c2 = SimpleComplex(3.4, 2.2)

        c3 = c1 * c2
        self.assertEqual(c3.a,0.4800000000000004)
        self.assertEqual(c3.b,-7.199999999999999)

if __name__ == "__main__":
    unittest.main()
