Return-Path: <ksummit+bounces-101-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE833683E9
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 7D7203E78F1
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FBC2FA0;
	Thu, 22 Apr 2021 15:43:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A801670
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 3EA9D128014A;
	Thu, 22 Apr 2021 08:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1619106179;
	bh=EhLkHjGAqBZa8dDTk8JN0rSYFp8WXAuEKB2ZHZ7feos=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=sPWToRDUq1ge7AfyQS5XzF9ujXMrkvHgRpjAHLzbvtU7AHnUnqmtZQ82nezl34X06
	 1CZlIy9Bchfv4NlxTPbgrXTKtqN2FBFBXEGXh5lITOJZRI8IiyzHRfVtVIs73vEAnj
	 M9arZIlo6x0e38FKVnXBuVEyy90EOEEEJpLuFElQ=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BxV2cwhLksyx; Thu, 22 Apr 2021 08:42:59 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id EE47C1280129;
	Thu, 22 Apr 2021 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1619106179;
	bh=EhLkHjGAqBZa8dDTk8JN0rSYFp8WXAuEKB2ZHZ7feos=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=sPWToRDUq1ge7AfyQS5XzF9ujXMrkvHgRpjAHLzbvtU7AHnUnqmtZQ82nezl34X06
	 1CZlIy9Bchfv4NlxTPbgrXTKtqN2FBFBXEGXh5lITOJZRI8IiyzHRfVtVIs73vEAnj
	 M9arZIlo6x0e38FKVnXBuVEyy90EOEEEJpLuFElQ=
Message-ID: <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Shuah Khan <skhan@linuxfoundation.org>, Mauro Carvalho Chehab
	 <mchehab+huawei@kernel.org>
Cc: ksummit@lists.linux.dev
Date: Thu, 22 Apr 2021 08:42:58 -0700
In-Reply-To: <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
References: 
	<afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	 <20210422123559.1dc647fb@coco.lan>
	 <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-04-22 at 09:34 -0600, Shuah Khan wrote:
> On 4/22/21 4:35 AM, Mauro Carvalho Chehab wrote:
> > Hi James,
> > 
> > Em Wed, 21 Apr 2021 11:35:36 -0700
> > James Bottomley <James.Bottomley@HansenPartnership.com> escreveu:
> > 
> > > I've long been on record as not really being a fan of trivial
> > > patches
> > > because they can cause merge issues with current patches and
> > > introduce
> > > bugs, particularly in older drivers, that don't get detected for
> > > a long
> > > while.  However, the recent events with the University of
> > > Minnesota:
> > > 
> > > https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> > > 
> > > Have elevated the risk factor around trivial patches claiming to
> > > fix
> > > bugs to the point where it looks like there's no such thing as a
> > > truly
> > > trivial patch and they all need reviewing.
> > > 
> > > Our policy in SCSI for a long time has been no trivial patches
> > > accepted
> > > to maintained drivers, and I think that would be a good start if
> > > adopted kernel wide, but I think the next policy should be no
> > > trivial
> > > bug fix without a pointer to the actual bug report or report from
> > > a
> > > trusted static checker.  This would likely mean we have to create
> > > a
> > > list of trusted static checkers ... obviously 0day and coverity
> > > but
> > > what else?
> > 
> > I agree that we should have a "Rethinking the acceptance policy"
> > talk
> > at the Maintainer Summit, but it should cover a scope wider than
> > just
> > trivial patches. At least the patches I checked, sent from
> > "@unm.edu"
> > to media subsystem, they all looked good enough to be merged[1].
> > 
> > The main question is actually what's the degree of confidence a
> > maintainer can rely on a patch sent from a random contributor.
> > 
> > That's not an easy task.
> > 
> > I mean, usually, each maintainer develops internally a "trust
> > score"
> > from subsystem's contributors, but such trustee level is usually
> > not
> > shared with other maintainers.
> > 
> > When a developer reaches a certain level, maintainers are willing
> > to merge their work faster as they know that the developer is
> > there for a while and it is not trying to harm the community.
> > 
> > Perhaps one thing that we could add would be a
> > scripts/get_developer_trustee_status, which would be returning
> > a set of indicators that would help the maintainer to know
> > how much it can trust a random contributor, like:
> > 
> > 	- how many drivers and patches a contributor has written;
> > 	- how long and how frequent he's sending Kernel patches;
> > 	- what subsystems received patches from him;
> > 	- if the developer isn't on a blacklist/graylist.
> > 
> > 
> 
> This will put new developers at disadvantage. Let's think this
> through before adding barriers for entry.

OK, so I think there are several separate topics now:

   1. how trust is generated in the ecosystem.  I think that's a long
      conversation and one of the big dangers is actually not only
      discouraging new entrants but also drive by submitters, who by their
      very nature will not have the necessary trust flag.  I still think
      if you don't know the submitter, you can still trust the code if you
      can clearly see what it's doing and why.
   2. Improving the requirement for bug fixes and large series, like cover
      letters to everyone, adding fixes: tag and clear explanation.
   3. Better handling of "trivial" changes, say via a resurrected trivial
      tree

James



