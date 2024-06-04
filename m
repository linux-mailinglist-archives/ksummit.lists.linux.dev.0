Return-Path: <ksummit+bounces-1218-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8389C8FBEFE
	for <lists@lfdr.de>; Wed,  5 Jun 2024 00:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3619286471
	for <lists@lfdr.de>; Tue,  4 Jun 2024 22:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A690F1442FE;
	Tue,  4 Jun 2024 22:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVM5ev1l"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E67928DC7
	for <ksummit@lists.linux.dev>; Tue,  4 Jun 2024 22:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717540424; cv=none; b=k5khRbFlcKTKkuadzAhSwA3v5bZq7hi5vQ1O+phFtACXAmDIiIY6zuCTc3bkFEEAE6n5VZeVQhRxbaRuexSQA0V4CvS89WF0wZtHilfgnCkv2l5L3K9xT7ams6BAWx4QqngQGRY/Fyk0XCSy3/EmcWrML7irgjLcELNA0RqcBdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717540424; c=relaxed/simple;
	bh=5dQPWL0ktCO3Q6ttieutThGTZYrIyCMG9ZFfD5FXlrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erJvAwvBHVA7PuHtS7tKJvL+VvwU3Cz3Nl3JNwn/j0gir/z25tJ9GzProfjBHvcX4kF8Av0UCeSoHnUJSDFl5Y31014pnz8uzYpku30Y5ZU4AMh0R/c4Sw/o8wospeS1ZZAtTZZXvHk/p8mWirDcvEDx/UOgsWejpeF7Fdwmi1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVM5ev1l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DB7C2BBFC;
	Tue,  4 Jun 2024 22:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717540423;
	bh=5dQPWL0ktCO3Q6ttieutThGTZYrIyCMG9ZFfD5FXlrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FVM5ev1lJGmRRFsnsvKSxA0i4UMRcdQvxMShD4lF+wWqFc5unxTxE5wcIgLy/6j3O
	 jjGkphQq+rcxNkc6o5LKb6iOjexDCUbtrt+Wn9dJQ6c6wHlevpZ0vfEiK8tfGxkU7o
	 hDb1n411WHBXjcS/zo4frYMEBzyOVU6iJIASvXHgA5xAfrF4exiKsUoiEOI8wHfIKa
	 BijDmz0OBlZsz3l9JlSyku0XZEqDJX1iMrp3+RU9OCGnvApF+Msc7CGxdZuOyicZCk
	 Hh6gU+8gj8O+sZrvQBtxUr0RvU8gy/601VNi2sEHqHciuxSPiYjVjF/xq061Ne5yVm
	 VcCQE9vUHWuXg==
Date: Tue, 4 Jun 2024 18:33:42 -0400
From: Sasha Levin <sashal@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Merge tree too flat?
Message-ID: <Zl-WRpN0-rBVS7F-@sashalap>
References: <nycvar.YFH.7.76.2406041151590.24940@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2406041151590.24940@cbobk.fhfr.pm>

On Wed, Jun 05, 2024 at 12:03:45AM +0200, Jiri Kosina wrote:
>On last year's maintainer summit, there was a session where Linus asked
>the participants to bring up topics / questions [1].
>
>I myself was the one raising the concern of the merge tree feeling a
>little bit too flat, and there seemed to be general agreement on that.
>
>Checking the git repository as of now, it seems like we have not changed
>anything in that respect over the past year, and a lot of things are going
>directly to Linus although they could be cascaded a little bit better,
>contributing to better load-balancing on all maintainer levels (including
>the top-level one, of course).

I'm not sure we should be pushing for a more hierarchial tree. Yes, it's
flat, but is it the issue we're trying to address?

With heirarchy, we're asking folks to layer one on top of the other, but
for most subsystems this doesn't work as well (outside, maybe, drivers
that fall under a single subsystem).

I'd argue that what we want is more co-maintainer groups where several
folks share the burden. This, in turn, makes the tree look flat (all of
"x86" is one maintainer group, for example).

I'd also point to the LWN article you've linked: the flat model isn't
called out as an issue either by Linus or by the rest of the group
(which is what I recall from the discussion). Yes, it's flat, but the
solution isn't to make it a pyramid.

-- 
Thanks,
Sasha

