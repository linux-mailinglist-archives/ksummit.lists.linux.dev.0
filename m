Return-Path: <ksummit+bounces-1003-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB377F64F
	for <lists@lfdr.de>; Thu, 17 Aug 2023 14:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3A9B1C20AFA
	for <lists@lfdr.de>; Thu, 17 Aug 2023 12:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B47F13FE9;
	Thu, 17 Aug 2023 12:17:45 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B642115
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 12:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2076EC433C7;
	Thu, 17 Aug 2023 12:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692274663;
	bh=GukJqcD0dw6iqqpiU/fGQRPXScNmhS2kv6om0MMRsqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRjc62j2e/wYuDwyKVNY1eeSUlcVQb1FJf2DFlVTsMNEGA3YyNEu0TSa2WiLRAod8
	 ohBYQfHKYUJjJT928CA27XxP9p4vU8wShNekusjBf54FIjLJqr0KwuuJISm9oz1Qd3
	 +7Q79jK2CDHUIlxRNXGPE0fFXW/or9Prj+XhVjFlZNotkckaRPPUDK4WdyK6Vxkio3
	 Gbv+2VgmyGYKaLgdUDUvPWv1Jn7s1tqARUbmkz5nE6DIrVHFqs4PN2CK+YP0ci2mYw
	 ssEehz+VousWvpG7j9w3jfuGprK1Pn/cAcHHK5ZG5gWP2JvF163WyUbLk0GwutvJI0
	 hEDAQQhXIzgPw==
Date: Thu, 17 Aug 2023 13:17:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <f7915398-b59a-4c9c-97c1-669be7471ec2@sirena.org.uk>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <87ttsx98ue.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HuAjra34Tj8usxm5"
Content-Disposition: inline
In-Reply-To: <87ttsx98ue.fsf@intel.com>
X-Cookie: Walk softly and carry a BFG-9000.


--HuAjra34Tj8usxm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 17, 2023 at 03:00:57PM +0300, Jani Nikula wrote:
> On Wed, 16 Aug 2023, Luis Chamberlain <mcgrof@kernel.org> wrote:

> > In so far as making it possible to get b) to help, my current excitement
> > surrounds around what Song Liu mentioned to me at LSFMM and then
> > quickly demonstrated that the eBPF folks are doing with patchwork.
> > Get the patches to be tested automatically, and *immediately*
> > patch reviewers and maintainers can get feedback if something is not even
> > worth reviewing.

> I'm all for automated testing and CI, and all i915 patches get tested
> before merging. But requiring everything to pass before a human so much
> as looks at it can be incredibly demotivating for contributors. For
> example, if they polish the contribution, and take all corner cases into
> consideration to pass the tests... and then get told their design is all
> wrong and needs to be redone from scratch. It's a balance.

Indeed, and you're relying on your test automation being robust, the
results being available promptly and the results being comprehensible if
people can't readily run the tests themselves.  That said I read the
above as more providing results so people can look at them rather than
gating looking at things (eg, if everything is failing it's probably
fine to not bother) - that seems a lot more reasonable.

--HuAjra34Tj8usxm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTeD+IACgkQJNaLcl1U
h9C/uAf9HY5nQPMd0ZrlaRRZSIMqow/6fsaYE2/ivdRVTu5kuwvg0gEs7FmDhjy3
4Q4jciJzFzMRrXvTbKaXeroK+GkMnAgiqk1iWSszzIWIwg3IBTbgLc6318XsJG0j
DTs2z4fr+NUmkNt0SJfhfxDwWIK9/XjqpXkyONc56y964p+dl3wBaHUnvMzwmj9y
3zOpgBF6xGhgFWMMAvgTkMqwT+hK1K78Mg2FGsr11GU+QsDH+/JEquRcxfPZ4I+d
WSCf6UjM14h4uX6HlyttcqXTFs7sEDVXvmOOifMm/4XHm39EkdhRhYpem8ooD9nf
tIeopioO0StiK1JyaiyzIc5ENJzqWw==
=5sUC
-----END PGP SIGNATURE-----

--HuAjra34Tj8usxm5--

