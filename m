Return-Path: <ksummit+bounces-810-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7F85F103B
	for <lists@lfdr.de>; Fri, 30 Sep 2022 18:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2433B2809AA
	for <lists@lfdr.de>; Fri, 30 Sep 2022 16:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627085A81;
	Fri, 30 Sep 2022 16:47:32 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13445A7C;
	Fri, 30 Sep 2022 16:47:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5723247C;
	Fri, 30 Sep 2022 18:47:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1664556447;
	bh=J8D/Bn7Wpr/IjvMKlhrSxs1NNupaYj+LgM6dPb2NuX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sdq6NxCDkbMg7Cl2rrYvx+omB+MnCQpnj5ag1p5guCzcn9X9kpfIcMxtL2wkR2DbP
	 aEEtsGWZyU+VjjgtHK1hV4SIuNyPkLc0EcVx7kdp9VtOojItigKVZDbEL7gWuxb66s
	 GpqkKuQRe2WcqLYnWufhjzy0S01zyG+QY8JPhRuA=
Date: Fri, 30 Sep 2022 19:47:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: "Bird, Tim" <Tim.Bird@sony.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Slade Watkins <srw@sladewatkins.net>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"workflows@vger.kernel.org" <workflows@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <YzcdnnjJA4M09dNH@pendragon.ideasonboard.com>
References: <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
 <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
 <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
 <F300ED64-5E8E-4060-89DC-C98BC5FF08E6@sladewatkins.net>
 <YzXK6Px+BrNuuMZH@pendragon.ideasonboard.com>
 <a86adc6d-05db-ec2e-c5de-d280aad9fb8a@leemhuis.info>
 <Yzbtuz6L1jlDCf9/@pendragon.ideasonboard.com>
 <BYAPR13MB250377AAFCC43AC34E244795FD569@BYAPR13MB2503.namprd13.prod.outlook.com>
 <3cfaef48-744f-000f-1be5-6f96d64dea24@gmx.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3cfaef48-744f-000f-1be5-6f96d64dea24@gmx.com>

On Fri, Sep 30, 2022 at 04:34:08PM +0000, Artem S. Tashkinov wrote:
> On 9/30/22 16:19, Bird, Tim wrote:
> > E-mails sent from a web interface could have as much structure as you'd like.
> > So one avenue would be to set up a nice interface for bug reporting, that just
> > delivered the form data in e-mail format to the proposed bug-receiving mail list.
> >
> > Also, if an e-mail receiver (something automated) gave a quick response on missing fields, I think
> > you could quickly train users (even first-time bug submitters) to provide required
> > data, even if they're sending from a free-form e-mail client.
> >
> > Just my 2 cents.
> >
> >   -- Tim
> 
> Debian uses an email based bug tracker and you know what? Most people
> avoid it like a plague. It's a hell on earth to use. Ubunutu's Launchpad
> which looks and feels like Bugzilla is a hundred times more popular.

It would be pretty sad if the only options we could come up with for bug
tracking would be either popular with reporters and ignored by
maintainers, or the other way around. Ideally we wouldn't have to decide
which of those two classes of users to prioritize, but I fear that,
given resource starvation, we'll have to make a decision there that will
be unpopular with one of the two sides.

> Sometimes programmers have to realize that most people around are not as
> smart as they are.

I wouldn't equate familiarity with classes of tools (and related usage
habbits) and intelligence. Some tools may be easier to learn and use,
but it doesn't mean they're good for the problem at hand. I used to joke
several years ago that the younger generation will force older
maintainers to switch to doing code review on facebook (nowadays I would
probably say tik-tok). And then
https://github.blog/2021-05-13-video-uploads-available-github/ happened.
And that https://www.videocode.review/ (meanwhile, git..b still don't
support commenting on a commit message in a review).

-- 
Regards,

Laurent Pinchart

