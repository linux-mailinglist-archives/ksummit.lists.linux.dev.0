Return-Path: <ksummit+bounces-1397-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D492930AD0
	for <lists@lfdr.de>; Sun, 14 Jul 2024 18:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53CE32819AD
	for <lists@lfdr.de>; Sun, 14 Jul 2024 16:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6913413B582;
	Sun, 14 Jul 2024 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="H8rIvi5n";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="H8rIvi5n"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4754384D30
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720974890; cv=none; b=aKN2K/Gy3WRuVFlRRnOae/Qgw6AUOYGxctYeiTB0MRhM1YUNACXbfzQWDzTWeTZUHxWGcpsWdK5K8vVicFpej3ljcYBI7O0LStWro1mrXAYzqWM+yw52ddpX+R3WTKqifhcH2oqU38xNtbycEUAThV1bD6WTtAXzpFfuQdii+Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720974890; c=relaxed/simple;
	bh=SptWhyeEd+BoDcXvX/gRmJQDxDZLYcCKLfw99Sc2Ra8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gItE5uNkpY09LdHzPg96uWUHf2WLZ0Z/tw15XOWnOLDBl4xMZovMGN5Toylivyz5KCVq15wz8AOxrlksrTLimrzYyfrWvVh0wF+PYEVz/PftzGz8nD+kZdDcz1Jd8rR63QdS7m0NREub9kDVKyHITTdqjxDm5pFwbaIsa6SfzrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=H8rIvi5n; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=H8rIvi5n; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1720974886;
	bh=SptWhyeEd+BoDcXvX/gRmJQDxDZLYcCKLfw99Sc2Ra8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=H8rIvi5ncmOYMgKKguVuxyZOiuPM1DaiCwgWGHsCrBRae9E5UNFnLT0mhC7TG94eX
	 CCw2f8c/CXY5rupzaeSpYAGaW6Du9emU5jovSv9lR0S8iFL9WM6GGzrO+IvMbgDCqn
	 Wb/6WnrXMYHGWEslThbS1MCldj735eimjMbzsJno=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 93F241286177;
	Sun, 14 Jul 2024 12:34:46 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id tTvxM5upqCnI; Sun, 14 Jul 2024 12:34:46 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1720974886;
	bh=SptWhyeEd+BoDcXvX/gRmJQDxDZLYcCKLfw99Sc2Ra8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=H8rIvi5ncmOYMgKKguVuxyZOiuPM1DaiCwgWGHsCrBRae9E5UNFnLT0mhC7TG94eX
	 CCw2f8c/CXY5rupzaeSpYAGaW6Du9emU5jovSv9lR0S8iFL9WM6GGzrO+IvMbgDCqn
	 Wb/6WnrXMYHGWEslThbS1MCldj735eimjMbzsJno=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D4FF612860AA;
	Sun, 14 Jul 2024 12:34:45 -0400 (EDT)
Message-ID: <349afdccc045b5270d3a0870e7a3237253b5fea8.camel@HansenPartnership.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev, Greg KH
	 <gregkh@linuxfoundation.org>
Date: Sun, 14 Jul 2024 12:34:43 -0400
In-Reply-To: <61bb6e19-4eff-416b-a3d6-932f4a313f69@lunn.ch>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
	 <61bb6e19-4eff-416b-a3d6-932f4a313f69@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2024-07-14 at 17:35 +0200, Andrew Lunn wrote:
> > One of the big reasons patches get Fixes without cc:stable is
> > simply that it's an -rc fix for a merge window regression (so no
> > released kernel has it in and therefore no stable kernel needs it),
> > so you'd also need to explain that case in the improve docs
> > (because it's a genuine fix, just not a stable candidate).
> 
> There is also the case where a patch which needs fixing has been
> queued into a -next tree by the Maintainer. So it is not even in an
> -rc yet, it is waiting or the next merge window to open.
> 
> So what we seem to be talking about is a Fixes: tag pointing to a
> patch in a released kernel, which does not have a stable: tag.
> 
> Why not simply get 0-day to enforce such patches must have a
> not-stable: tag? Such emails should quickly train developers to do
> the right thing.

Because the not-stable tag seems yet another really hard to use thing.
When Maintainers look at patches, about the first question is where did
this come from (Fixes answers that and we're having good success
tagging most things with it because it's obvious how to apply it---and
not derailing this is another good reason not to split the tag).  The
next question is should this be backported.  This is a bit more
subjective because it's a combination of would anyone actually see any
effects from this or is it a serious enough problem in general that it
might lead to some exploit or bug.  However, this is the judgment call
that can often prove wrong with hindsight, so we have the send
separately to stable channel if this turns out to be the case.  The
not-stable tag seems to be a pejorative statement that only an idiot
would backport this so don't.  I can't see myself tagging any Fixes
tagged commit with that because it's a judgment call as likely to be
wrong as the initial cc:stable decision, so it seems more aimed at
enhancement patches that wouldn't have a Fixes tag anyway and therefore
shouldn't be backported.


I think the actual problem the not-stable tag is meant to solve is some
commits that aren't fixes tagged actually end up in stable when they
shouldn't be there; their presence causes bugs and whoever the
maintainer is gets annoyed that it got backported.

James


