Return-Path: <ksummit+bounces-1395-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 371A6930A27
	for <lists@lfdr.de>; Sun, 14 Jul 2024 15:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 684941C20DB2
	for <lists@lfdr.de>; Sun, 14 Jul 2024 13:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7B9131BDD;
	Sun, 14 Jul 2024 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="veIayWBk";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="veIayWBk"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD758481AB
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720964133; cv=none; b=lYqSbmle3QqyHNEIGtb5AM8aKB/EOtRpSItywuVlVFenU3csyuW6ef9oQxpEabU2WWTB3e3qRof+5YezepCgzPW+zoBBztpb7zn0Fze9YGEMzC9RwzCptWeAQQ1koe0A1bsVwFelICbg2qTEUzlFshURcBiDSDzyvEcZ13BIOgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720964133; c=relaxed/simple;
	bh=YqUy56nFth/8mH/oFnQczJPZctsnaCLXCeaNSFvuUK4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mdj0kW8olEXkHXdkWt7VDbcq3loFbfn6FQrc4FnZz8kGps3122c+z2U25n3j8IML/wE3ze99WoA0BJLyS8qVwQIQicAPdcbIeGZADMGwKNFUSLdWfEc+qrOeY6v2PjGOvtZWqLzeOgKsNwcWIKgmgbaWbTVLOdcC0av3C5NnKog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=veIayWBk; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=veIayWBk; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1720964128;
	bh=YqUy56nFth/8mH/oFnQczJPZctsnaCLXCeaNSFvuUK4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=veIayWBkCxwa/AE/NxaGoj3cBErjsbl5pSxnEwMizTu/wvW8T0l/QtHxHeVT/uUqJ
	 TAWMrYT+se3G9/0KKXPTUMlYTEjBygftCvU2NNp+gZWcjXdUi7USnFKPhs+0+SMedB
	 mXu+IjAEIh4Bn/N9NH+j1RRV5fZCiQxxFr1ECIqI=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id D381312861F6;
	Sun, 14 Jul 2024 09:35:28 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 0SK6HMxCxfOO; Sun, 14 Jul 2024 09:35:28 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1720964128;
	bh=YqUy56nFth/8mH/oFnQczJPZctsnaCLXCeaNSFvuUK4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=veIayWBkCxwa/AE/NxaGoj3cBErjsbl5pSxnEwMizTu/wvW8T0l/QtHxHeVT/uUqJ
	 TAWMrYT+se3G9/0KKXPTUMlYTEjBygftCvU2NNp+gZWcjXdUi7USnFKPhs+0+SMedB
	 mXu+IjAEIh4Bn/N9NH+j1RRV5fZCiQxxFr1ECIqI=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 505781280293;
	Sun, 14 Jul 2024 09:35:28 -0400 (EDT)
Message-ID: <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Cc: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 14 Jul 2024 09:35:26 -0400
In-Reply-To: <ZpPFJH2uDLzIhBoB@sashalap>
References: <ZpPFJH2uDLzIhBoB@sashalap>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2024-07-14 at 08:31 -0400, Sasha Levin wrote:
> Hi folks,
> 
> The Linux kernel community relies heavily on commit tags to identify
> and manage patches destined for stable kernel branches. Currently, we
> use a "Stable tag" (cc: stable@kernel.org) to indicate that a patch
> should be included in stable kernel branches, and a "Fixes tag"
> (Fixes: 012345678901 ("commit subject")) to point to an older commit
> that the new commit fixes or improves. However, this scheme has led
> to some unintended consequences.
> 
> One of the main issues is that most Fixes-tagged commits (>80%) end
> up in a stable tree, leading some authors to omit the Stable tag
> altogether. This means we may not be trying hard enough to include
> critical commits in stable kernel branches. On the other hand, some
> authors are unhappy when commits without a Stable tag end up in a
> stable kernel branch. To address these shortcomings, I propose
> introducing an "Improves tag" (Improves: 012345678901 ("commit
> subject")) and altering the meaning of the Fixes tag.

I've got to say this looks like a bad idea: your complaint is we're not
being clear enough about the cc:stable and fixes semantics, so the
proposal is to introduce a tag with even less clear semantics in the
hope that it will somehow improve the situation. Why not simply be much
more crisp about the meaning of Fixes and no cc:stable? If everyone
realised that Fixes without cc:stable meant the patch wouldn't be
included in a stable tree that surely gives all the semantics you need
without having to get everyone to try do differentiate between a fix
and an improvement?

One of the big reasons patches get Fixes without cc:stable is simply
that it's an -rc fix for a merge window regression (so no released
kernel has it in and therefore no stable kernel needs it), so you'd
also need to explain that case in the improve docs (because it's a
genuine fix, just not a stable candidate).

So the clear rules look like they should be

   1. every patch fixing something should have a fixes tag pointing to
      the fixed commit
   2. Only patches with cc:stable should go automatically in to stable
      trees and as far back as the fixes tag allows
   3. if a patch without cc:stable is later discovered to be a required
      fix, people can ask for it to be backported.

James


