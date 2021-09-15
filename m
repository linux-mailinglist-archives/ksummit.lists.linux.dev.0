Return-Path: <ksummit+bounces-583-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69EA40C9DB
	for <lists@lfdr.de>; Wed, 15 Sep 2021 18:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id DA5E11C059A
	for <lists@lfdr.de>; Wed, 15 Sep 2021 16:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34503FD8;
	Wed, 15 Sep 2021 16:14:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3E73FC5
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 16:14:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 388FF24F;
	Wed, 15 Sep 2021 18:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631722456;
	bh=HwscfQtLrfhy/O4mVJA3FQWwiUMSaCuL/ZWxXi3PpRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K9NCiZoE7nWSxgZ7vrbbNdk0DtshNepzsviLSii2xVREyz8dej8/pN3ZIbzOqa2kP
	 SpAnMH4w+mC8U2dmivabCKb1nEKtXqX/818W4BRli3kwWdzYUmpB3MLX4KTWmLX0yd
	 voBWRiFWXYM0ZP+7/DfXIv4/w7TrL92dn3gnpNZA=
Date: Wed, 15 Sep 2021 19:13:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Laura Abbott <laura@labbott.name>
Cc: ksummit@lists.linux.dev,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tech-board-discuss@lists.linuxfoundation.org" <tech-board-discuss@lists.linuxfoundation.org>
Subject: Re: Reminder: Voting procedures for the Linux Foundation Technical
 Advisory Board
Message-ID: <YUIbvmPUEUtf/BDU@pendragon.ideasonboard.com>
References: <fccbdadc-a57a-f6fe-68d2-0fbac2fd6b81@labbott.name>
 <b90db9e7-9b6b-c415-d087-3505ba0be0d6@labbott.name>
 <YUH+DO5aHWGVdNb7@pendragon.ideasonboard.com>
 <dc45975a-86df-a70d-ff15-58a3bdcf09ee@labbott.name>
 <YUIHPv3uvAZjJxfB@pendragon.ideasonboard.com>
 <90e00588-3596-01f5-e5a0-73516224b883@labbott.name>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90e00588-3596-01f5-e5a0-73516224b883@labbott.name>

Hi Laura,

On Wed, Sep 15, 2021 at 12:07:13PM -0400, Laura Abbott wrote:
> On 9/15/21 10:46, Laurent Pinchart wrote:
> > On Wed, Sep 15, 2021 at 10:36:45AM -0400, Laura Abbott wrote:
> >> On 9/15/21 10:07, Laurent Pinchart wrote:
> >>> On Wed, Sep 15, 2021 at 09:58:32AM -0400, Laura Abbott wrote:
> >>>> On 9/9/21 12:49, Laura Abbott wrote:
> >>>>> Hi,
> >>>>>
> >>>>> Reminder that the Linux Foundation Technical Advisory Board (TAB) annual
> >>>>> election will be held virtually during the 2021 Kernel Summit and Linux
> >>>>> Plumbers Conference. Voting will run from September 20th to September
> >>>>> 23rd 16:00 GMT-4 (US/Eastern). The voting criteria for the 2021 election
> >>>>> are:
> >>>>>
> >>>>> There exist three kernel commits in a mainline or stable released
> >>>>> kernel that both
> >>>>> - Have a commit date in the year 2020 or 2021
> >>>>> - Contain an e-mail address in one of the following tags or merged
> >>>>> tags (e.g. Reviewed-and-tested-by)
> >>>>> -- Signed-off-by
> >>>>> -- Tested-by
> >>>>> -- Reported-by
> >>>>> -- Reviewed-by
> >>>>> -- Acked-by
> >>>>>
> >>>>> If you have more than 50 commits that meet this requirement you will
> >>>>> receive a ballot automatically.
> >>>>>
> >>>>> If you have between 3 and 49 commits that meet this requirement please
> >>>>> e-mail tab-elections@lists.linuxfoundation.org to request your ballot.
> >>>>> We strongly encourage everyone who meets this criteria to request a
> >>>>> ballot.
> >>>>>
> >>>>> We will be using Condorcet Internet Voting
> >>>>> Service (CIVS) https://civs1.civs.us/ . This is a voting service
> >>>>> focused on security and privacy. There are sample polls on the
> >>>>> website if you would like to see what a ballot will look like.
> >>>>>
> >>>>> If you have any questions please e-mail
> >>>>> tab-elections@lists.linuxfoundation.org.
> >>>>>
> >>>>> Thanks,
> >>>>> Laura
> >>>>>
> >>>>> P.S. Please also consider this another reminder to consider running for
> >>>>> the TAB as well
> >>>>
> >>>> Final reminder: please remember to request your ballot for the TAB
> >>>> elections. If you know others who are eligible please encourage
> >>>> them to request a ballot as well.
> >>>
> >>> When are the ballots supposed to be sent ? It would be nice to avoid
> >>> requiring everybody to check whether they're below or above the 50
> >>> commits threshold manually :-)
> >>
> >> The ballots will be sent sometime after Monday September 20th
> >> 9:00am GMT-4 (US/Eastern).
> >>
> >> I did make an attempt to send e-mails to the > 50 commits individuals
> >> but there is a chance my e-mail got eaten by spam filters or just
> >> didn't get sent out. I discovered Google Apps' e-mail limits and
> >> that you should not attempt to bcc too many people. This is something
> >> I'd like to handle in a more automated fashion next year to make
> >> it easier for both voters and those running the elections.
> > 
> > Does it mean I should ask for a ballot after the 20th if I don't get
> > one, or request one *before* ? I meet the above criteria but haven't
> > received any ballot yet, so I was unsure whether I should ask or wait.
> 
> The intention was that if you were in the range of between 3-49 commits
> you would ask for a ballot now.

Would it be possible to share the script that you are using to check in
which category a developer is, to avoid the criteria being applied in
slightly different ways ?

-- 
Regards,

Laurent Pinchart

