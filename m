Return-Path: <ksummit+bounces-1179-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E10737A88C8
	for <lists@lfdr.de>; Wed, 20 Sep 2023 17:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE5121C20A7C
	for <lists@lfdr.de>; Wed, 20 Sep 2023 15:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD16B3C69B;
	Wed, 20 Sep 2023 15:46:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633E638DEB
	for <ksummit@lists.linux.dev>; Wed, 20 Sep 2023 15:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11220C433C8;
	Wed, 20 Sep 2023 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695224759;
	bh=ff0hkpS1Szt1KkDmya8pWl4ogYwhgNztAND7aD90sCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqs/J6/m7zZD83W1DwiUlVmUVdeEUiJnBvBTjZnGvLhe14gnXD/EGvmkj3NCNBP+h
	 4IgmYkFAjuTw0kbtQaRaydPxrrB6b9k9O6TU+bAHtr+ozf26EhY0apXD+T/CpFKjuS
	 j/0tpPt8ZEONmPZJ2uT0yfQNn/pwGNwRViz+QxMsGd+fi/t3oigV0YGrw7NhAVkmE5
	 WHOBtUZLD+cq1Io+dMi0vox7IJpHn+gPzGrjI3CBOyRqV5Itp84Bw9NbkwZEoZE2Xc
	 /5HkUEBks7h2sB13/jlMh+qZvAWPHliWPdXfNESyDitXj41P1hLblZ21ooM/ZPv+3L
	 6/N2ao7xunTHw==
Date: Wed, 20 Sep 2023 16:45:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: ksummit@lists.linux.dev, tech-board-discuss@lists.linux-foundation.org
Subject: Re: [MAINTAINERS SUMMIT] Maintainers Support Group
Message-ID: <b7f6d444-a3c0-459d-a683-8ea2e160160d@sirena.org.uk>
References: <20230919121001.7bc610d4@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Jmdq4yfHdJaoea2"
Content-Disposition: inline
In-Reply-To: <20230919121001.7bc610d4@gandalf.local.home>
X-Cookie: Even a hawk is an eagle among crows.


--+Jmdq4yfHdJaoea2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 19, 2023 at 12:10:01PM -0400, Steven Rostedt wrote:

> The problem is that there's been no replacement for the maintainer to
> release their frustration.

...

> I brought up to the TAB a suggestion of starting basically a "Maintainer's
> support group". A place a maintainer, or even a submitter can go to when
> they are feeling frustrated. This is not a replacement for the Code of
> Conduct committee. This is more of a preventive measure. Ideally, the Code
> of Conduct committee members should be very bored where there are no
> submitted reports.  That would mean our community is running in a very
> smooth way. But that's currently not the case. There's been a few cases
> that have come up where if the maintainer had someone to vent to, it could
> have prevented the violation of the Code of Conduct.

...

> When a maintainer is getting frustrated with a submitter or another
> maintainer, or even a submitter is getting frustrated with a maintainer,
> they would have a place to find a list of people that can help. They would
> pick one of the people and send an email to them with a subject of
> "[MAINTAINER SUPPORT]" (or something like that). This would let the
> supporting maintainer know that this email is about support and should be
> confidential and follow the guidelines. The email will include who and why
> they are frustrated with the other person. Again, this is *not* a Code of
> Conduct issue. This is not to point blame, just frustration. Sometimes
> people just can not work with other people. The supporting maintainer can
> be an outside POV and can possibly help with explaining why the other
> person is acting the way they are. Or the supporting maintainer can find
> another maintainer to work with this person.

I think this is a really good idea, and I do think the bit about
submitters also getting frustrated with maintainers is important here -
there's a lot of "the process isn't working well" about this stuff which
will apply just as much to submitters.  It's going to be more obvious to
us as maintainers that there's issues for maintainers, and in general
submitters have more valves for releasing frustration (eg, for a lot of
them it's easy to just walk away, though that's not true for everyone).

--+Jmdq4yfHdJaoea2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmULE7MACgkQJNaLcl1U
h9Dl6wf9E8WwaeqOkbppGzFBtJiLohtAHD3vKM6b0qsLgH5rx0okexsHQj7NkWhF
HA4DE1IJHA3yb0LhkajzI1uRemsM5NVB9W617Uu3AU3msYrduhHKgNLdEjIyCOHT
wdaKlo2FtrQVFFp54IvWpJlA/1j52k/nD+D3EbSuWy7Fs/ZRRG5jpgjTX4ci3ZFw
wNx1tLgLRJXCWezCogD2pz150kmj8WX9hY5szGc7xW46jZheKJ1x5QCHrb35+HEw
hgxkesPHh0OxmW7kwpgpQhu8dSgB+nQVW+lFij9wkYdXkl/ONJfTxBv3yE/I/DmN
EVpbKq+eYEWuJsRtE3etqwpLuOOGfg==
=X3Ua
-----END PGP SIGNATURE-----

--+Jmdq4yfHdJaoea2--

