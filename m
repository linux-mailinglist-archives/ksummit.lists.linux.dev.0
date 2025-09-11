Return-Path: <ksummit+bounces-2364-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 435B8B53C46
	for <lists@lfdr.de>; Thu, 11 Sep 2025 21:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA9473A4F3F
	for <lists@lfdr.de>; Thu, 11 Sep 2025 19:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F353F25C822;
	Thu, 11 Sep 2025 19:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hvpoGfpS"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6753954652
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 19:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757618985; cv=none; b=Nhl2O9/3hEwXD4XUUBMuCf6Rcru02iA2k13llyx+mJpQauq5klR2dIU9M63lvtoFjNgMFpvPrNifL7n7iAoza34yG+TW0d5xUh1pzXgt3RlR1LwJa9CypjDYjyk5kPjVMzS5KbWPe3VyYwRIsfAQV5hwrTEKAkOsv0eisaCFvok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757618985; c=relaxed/simple;
	bh=xH3L+rJDeHoo+3xCa6E7H8LcQh2CpUhxXwHIUZf3qDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHVRS2wFJRyTyFE2BW9Sdn3PFVepLSTQpF075MEH3ayKeNqJfQvgBjT3IE1ecUh51D/pZblgByD5qLZo/OYJJDWYW3/jq1mLWFLmQb7px/0UvNt376blCkBMOJxNo9473mBuq8c8st616L6tUXfZQW2+dwmvBaE/L9ZwVDKJdLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hvpoGfpS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CF5FC596;
	Thu, 11 Sep 2025 21:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757618905;
	bh=xH3L+rJDeHoo+3xCa6E7H8LcQh2CpUhxXwHIUZf3qDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvpoGfpS2QV+5yAu7Kf9gxOXbLZBAoLMlvJyN0syQYa1E3tAc1iFdhTk/HTggjByu
	 7PcFeusGDtNCFi0p4lFOPP4vW1QmbxO8pvcDmi+JtzgwQAS5hmFeP2watfei5m4jzQ
	 QipfABIMWGaCgT+JAKrB7r4yBBAAtTo19FPZkSkw=
Date: Thu, 11 Sep 2025 22:29:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <20250911192914.GG13915@pendragon.ideasonboard.com>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <20250911122711.GC8177@pendragon.ideasonboard.com>
 <e7a60ee9-77fe-4729-a58d-441543792de7@sirena.org.uk>
 <20250911102506.43ee7f9c@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911102506.43ee7f9c@gandalf.local.home>

Hi Steve,

On Thu, Sep 11, 2025 at 10:25:06AM -0400, Steven Rostedt wrote:
> On Thu, 11 Sep 2025 14:40:45 +0100 Mark Brown wrote:
> 
> > > I've heard a maintainer saying that Linus doesn't like subsystem trees
> > > to have lots of merges. Any help debunking that would be appreciated.  
> > 
> > AIUI it's a quality of merges issue rather than a number of merges
> > issue, if the merge commits all have commit messages that convey useful
> > information about something that makes sense then you should be fine.
> > If the merge commits are all just default messages not so much.  Things
> > like taking a pull request with a descriptive commit like the cover
> > letter for the merge hopefully do have some purpose and a useful commit
> > message.  
> > 
> > The quantity thing comes up because a common way you end up with a lot
> > of merges is automation which tends to also imply lacking changelogs and
> > motivation.
> 
> Basically a merge commit should be no different than any other commit. It
> should have a purpose and that purpose should be described in the merge's
> change log just like every other commit has its purpose described in their
> own.
> 
> I now have several topic branches, and I try hard to avoid merges as they
> tend to make my pull requests more complex. But every so often, I have a
> patch that comes in that is required for work in two of my existing topic
> branches. This is a case where one change is required for two topic
> branches to continue more work.

Do you then send an individual pull request for each topic branch to
Linus ?

What if one of those topic branches had to aggregate patches from, let's
say, 10 different series from 10 contributors who each sent you a pull
request ? Would you merge them or cherry-pick them ?

> In these rare events, I will apply the change to one of the topic branches,
> then merge it into the other with a detailed explanation to why I needed to
> do that merge.
> 
> Linus hasn't complained about it, so I'm guessing that's the correct thing
> to do.

-- 
Regards,

Laurent Pinchart

