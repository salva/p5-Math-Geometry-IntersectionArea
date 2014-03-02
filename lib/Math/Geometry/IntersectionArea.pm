package Math::Geometry::IntersectionArea;

our $VERSION = '0.01';

use strict;
use warnings;
use 5.010;
use Math::Vector::Real;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

# ia stands for intersection area

# given a circle C(Z, R) and a segment S(A,B), this sub returns the
# oriented area of the intersection of C and the triangle ZAB

sub _a_triangle {
    my ($a, $b) = @_;
    0.5 * ($a->[0] * $b->[1] - $a->[1] * $b->[0]);
}

sub _ia_circle_segment {
    $z = V($_[0]);
    my $r = $_[1]; my $r2 = $r * $r;
    my $a = $_[2] - $z;
    my $b = $_[3] - $z;
    my $an2 = $a->norm2;
    my $bn2 = $b->norm2;
    if ($an2 < $r2 and $bn2 < $r2) {
        return _a_triangle($a, $b);
    }
    else {
        # find the two points where the segment intersects the circle solving the cuadratic equation
        #   norm(alfa * a + (1 - alfa) * b) = d
        # we calculate the coeficientes c2, c1, c0 such that
        #   c2 * alfa**2 + 2 * c1 * alfa + c0 = 0

        my $ba = $b - $a;
        my $c2 = $ba->norm2 or return 0; # a and b are the same point
        my $c1 = $b * $ba;
        my $c0 = $bn2 - $r2;
        
        my $discriminant = $c1 - $c0 * $c2;
        if ($discriminant <= 0) {
            # the sector is fully contained inside the triangle
        }
        else {
            my $inv_c2 = 1/$c2;
            my $sqrt_discriminant = sqrt($discriminant);
            my $alfa0 = $inv_c2 * (-$c1 - $sqrt_discriminant);
            my $alfa1 = $inv_c2 * (-$c1 + $sqrt_discriminant);
            if ($alfa1 <= 0 or $alfa0 >= 1) {
                
            }
                if ($alfa1 <= 0)

            }
        }
        
    }
}


1;

__END__

=head1 NAME

Math::Geometry::IntersectionArea - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Math::Geometry::IntersectionArea;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Math::Geometry::IntersectionArea, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Salvador Fandiño, E<lt>salva@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by Salvador Fandiño

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
