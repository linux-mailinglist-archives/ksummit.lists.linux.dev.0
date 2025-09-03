Return-Path: <ksummit+bounces-2281-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB303B41534
	for <lists@lfdr.de>; Wed,  3 Sep 2025 08:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9310561A63
	for <lists@lfdr.de>; Wed,  3 Sep 2025 06:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622462D781B;
	Wed,  3 Sep 2025 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="dBqk2tGg"
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C22E2D4800;
	Wed,  3 Sep 2025 06:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756880982; cv=none; b=UrphMLVeTX2PAUmK8U6vm2H47HTdlf9w1CyCsu3uaQbFPuuSfvqpKDAHpz0wXkkgQD2OuKlGlNlfufpw+uc4BqlUR5ZrVDfFkDWYVjMO0d9H/X9Ufenc2isz5v/0tdh2tP/aEJ17RE4DwZsJeLehXdL5jiDOT4/MAj9/nG1HsZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756880982; c=relaxed/simple;
	bh=XGSe0vTzxavK4Qvvj/0nw6uiKAgfXoDEBIu9yq71WkQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l5JBR8fi+m0zgzy5DxIV+naaSL3UaNODQBbSnRKq3CLvh3jEiJcx5c+p3f6ko7BmOTY6gIpmMlWVWK25jp/I3KkSLIKfP4fOnmfRXhjDk2bsV/cdwwv41DgensoDKWO16qeVKaiFScYgf3rVhjMvhVEeH1zixAVJfi1ES8+98kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=dBqk2tGg; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ptE1MLGqH6kr3/uIecksxF55+XxR2kaHAJ5z60khxJQ=;
	t=1756880981; x=1758090581; b=dBqk2tGgfibsbxV3sOUNjM8XBOT/drJyMxk3ssgsE+qLsFb
	fYwBWE9UdrBuppxCuGYo0ADu/tDl6TqU6tmnPh6RXjCt/z7fa8V0X6NkmynLNPHH9H5gTe0bUG4VB
	daKSTLAFpLhj886lwt8xfsuJcM97EJjvEaILA58cVbfBp4Y/z8B/wbn0r1DXPXrFKVHnLwk234pQH
	74D8meWClB88gk6An7vnkAmyHF/ReEGaZxS9CuIKkqiRisvu6DB4Ng58hOJHSKLH6StiCUrZJHa9f
	d/5czusFFCCO+jdOitpOvJ45DR469VujFVF3Gk+PwSMBOK8Z8l16IxkI7RbhDyeQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1utgzu-0000000BOEs-4B8Q;
	Wed, 03 Sep 2025 08:29:35 +0200
Message-ID: <b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
From: Johannes Berg <johannes@sipsolutions.net>
To: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
	 <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jani Nikula
 <jani.nikula@intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, 	ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>,  Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Date: Wed, 03 Sep 2025 08:29:34 +0200
In-Reply-To: <87frd4vfys.fsf@trenco.lwn.net>
References: <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
	 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
	 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
	 <20250901204635.51b81ffd@foz.lan>
	 <1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
	 <j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
	 <865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
	 <20250902135938.35048fbc@foz.lan> <20250902141434.3e5b14e4@foz.lan>
	 <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
	 <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
	 <87ecsox4uy.fsf@trenco.lwn.net> <20250902191929.504977bf@foz.lan>
	 <87frd4vfys.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Tue, 2025-09-02 at 12:58 -0600, Jonathan Corbet wrote:
> >=20
> > The idea is not to override the search path: instead, to use it to
> > check if the user installed other /usr/bin/python3.* files (or on
> > some other part of PATH). Most distributions nowadays come with=20
> > multiple python versions. I can't see a downside (*) of not using=20
> > a newer version that the user had installed on his system and
> > has it on PATH.
>=20
> But overriding the path is exactly what this would be doing.  It doesn't
> seem right to say "we know better than you do" and circumvent the
> configured path; the user may well have reasons for setting things up
> the way they did.

Absolutely! Please don't ever do this.

For example, use case we have: using nix-shell to lock down the software
used to build, for reproducible builds and similar reasons. Without --
pure, PATH may still contain (last!) software from the system itself,
but it should basically never be used.

johannes

