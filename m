Return-Path: <ksummit+bounces-2345-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9C2B53270
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1C77564A5D
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C97B322A22;
	Thu, 11 Sep 2025 12:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZTkzbDl3"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262C322750
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594212; cv=none; b=rRYsqW6uNWhB7XkNlIQfz+gsdv7I7PJr76G7uAFQbQEmwUzwze5Pq9ACBXkabpcPrS2YhHYwH/1zyjRehpTPX/hWclZbF+PBgqPzESufkoS2mG/x+nG9KZmrdnAux9qR0ut4vcSZvzkEPbtBi3p5xSURLI5pZLFYwwHI1RIOrPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594212; c=relaxed/simple;
	bh=ddJiE7KSMq8rWHB0e5kYMfvn153k/AZO3qIx86Pwj9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Phcidwy0clSgy8HZjNZhT31mMIa7xoJ2iz7FYXUNehx8ZnyjzK4SQWszCBHx/vBdfo1w3iDtljUNtIV/D903V7ov0DxJvnWWwN+kCjJtc8TMk/VphkaEidDkU8bwomwGJVU2CqK5qFuf5NgD8PCNCiGn0B0hRriIKb2oHg+FQ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZTkzbDl3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E8979666;
	Thu, 11 Sep 2025 14:35:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757594135;
	bh=ddJiE7KSMq8rWHB0e5kYMfvn153k/AZO3qIx86Pwj9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTkzbDl3T4w0kuwji1AOf65DQ86kogKWl11YJXCcBzn4IjXgwrCG50syCsI0xTDyF
	 c7K2w9abc/Bk1gem7RGgXWOLTz95iLvssAMOKAVQqLwgNKHSkWueyf5ou6kL4aRxCI
	 TgAQAI6fWsYQCJ5xOKbY8MTrNMSYY/7ClN7pIHWw=
Date: Thu, 11 Sep 2025 15:36:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <20250911123624.GE13915@pendragon.ideasonboard.com>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <20250911122711.GC8177@pendragon.ideasonboard.com>
 <8e0590dcae46d8f8c3b8c29427b4c8ced227ea92.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8e0590dcae46d8f8c3b8c29427b4c8ced227ea92.camel@sipsolutions.net>

On Thu, Sep 11, 2025 at 02:35:38PM +0200, Johannes Berg wrote:
> On Thu, 2025-09-11 at 15:27 +0300, Laurent Pinchart wrote:
> > 
> > > Just a friendly note, Laurent, I appreciate your work and I do not want
> > > to point that you committed it incorrectly. In the contrary - your
> > > commit is right, but your upstream maintainer stops you from including
> > > this in linux-next. My aim here is only to discuss and improve the process.
> > 
> > I would be happy to have my tree included in linux-next. I'm worried
> > that the fact that the media subsystem cherry-picks my pull requests
> > instead of merging them would cause issues though. Am I worrying
> > needlessly, or is that a real issue ?
> 
> If they end up in both trees with different commit IDs it'll get flagged
> (and you'll get an email about it), but presumably you'll drop them from
> your trees pretty much as soon as that happens, so it should be fine
> afaict.

If it happens as an accident, sure, but I don't think it's a very nice
mode of operation as a standard process.

-- 
Regards,

Laurent Pinchart

