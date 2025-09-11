Return-Path: <ksummit+bounces-2355-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4560DB53605
	for <lists@lfdr.de>; Thu, 11 Sep 2025 16:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F23FB3A3AE5
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2A7342CB6;
	Thu, 11 Sep 2025 14:44:05 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A7C335BAF
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 14:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601845; cv=none; b=mgec10xtkD4CEVWFCWPEwL0S3wrkwOB0c5pu4Hhj17t/uwdocsceRhj8KEVPf2bTeyW4rWHRmwk/diQ3mRZSuMCkrE+RBlehC79k51zywnHUwA5nCpaBNVRnbgE/nYwOMpTFuLiceLWS00gFvtwGQHV3ucV6BTjGeoDuU2q0mC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601845; c=relaxed/simple;
	bh=D9251gVNpN6ScPhl1MhJypVgo9NtDO+gQ393PLZgWNw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RlYjk9Z4kh26hzKf4X/3FYGr6Tb+Mn+v4DjeK++4dqFJDNVARQ9LqdfvKGbH6/FEC6yRx6pHzSQgzefBoi2rV0GJEyrTiDrrhTyaMywD4SQoDopRb7eF/CgtDy6r9DHBTbggpF3/OAo09brydpFr2QAC3XHiRCRbo8LCVM0ZCBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 0FF0316023E;
	Thu, 11 Sep 2025 14:24:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 53DDF2000F;
	Thu, 11 Sep 2025 14:24:14 +0000 (UTC)
Date: Thu, 11 Sep 2025 10:25:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Brown <broonie@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <20250911102506.43ee7f9c@gandalf.local.home>
In-Reply-To: <e7a60ee9-77fe-4729-a58d-441543792de7@sirena.org.uk>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
	<20250911122711.GC8177@pendragon.ideasonboard.com>
	<e7a60ee9-77fe-4729-a58d-441543792de7@sirena.org.uk>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: a3pz9zubz1hw1y37o87bsfi1yzhiik34
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 53DDF2000F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18G5prZjWlZ5QpPRfnUdnbXwgXySOIKBYs=
X-HE-Tag: 1757600654-966623
X-HE-Meta: U2FsdGVkX1+s9AUqWTTHgc56BpNtjWOEQLldV2+NtkMeeLVscAge4rp+U9U5rO0PGzc4H4DDsVSRyfs5LZJ86sLEcbcjpe3kLkBbJkTnhR+MSqZjtBCZwrtaCgByze7A6zRAW06lzafugCk4o1JOQ/rO+SsWdNCK04mSASvfW/dYBqx9/7kuEQ7RFCLUXWxbwO1TmysnzupKcXcAQmaavWznhlo8/hRVdT2osBVpcXaHxQSHoYixzpxUuLvmCfBjGq0mqXYXsPHMX+Op4CI+YhGXFFFieeCDhRykyINoSCLXkQRqGHoGqpX7VWI+FwuMnzc33gAhTdKz10TD9ttTWt4DqgGXFyXn

On Thu, 11 Sep 2025 14:40:45 +0100
Mark Brown <broonie@kernel.org> wrote:

> > I've heard a maintainer saying that Linus doesn't like subsystem trees
> > to have lots of merges. Any help debunking that would be appreciated.  
> 
> AIUI it's a quality of merges issue rather than a number of merges
> issue, if the merge commits all have commit messages that convey useful
> information about something that makes sense then you should be fine.
> If the merge commits are all just default messages not so much.  Things
> like taking a pull request with a descriptive commit like the cover
> letter for the merge hopefully do have some purpose and a useful commit
> message.  
> 
> The quantity thing comes up because a common way you end up with a lot
> of merges is automation which tends to also imply lacking changelogs and
> motivation.

Basically a merge commit should be no different than any other commit. It
should have a purpose and that purpose should be described in the merge's
change log just like every other commit has its purpose described in their
own.

I now have several topic branches, and I try hard to avoid merges as they
tend to make my pull requests more complex. But every so often, I have a
patch that comes in that is required for work in two of my existing topic
branches. This is a case where one change is required for two topic
branches to continue more work.

In these rare events, I will apply the change to one of the topic branches,
then merge it into the other with a detailed explanation to why I needed to
do that merge.

Linus hasn't complained about it, so I'm guessing that's the correct thing
to do.

-- Steve

