Return-Path: <ksummit+bounces-1264-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B989A908BA2
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 466882829B4
	for <lists@lfdr.de>; Fri, 14 Jun 2024 12:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E965F196C8C;
	Fri, 14 Jun 2024 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="osJHxERN"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B997E574
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718368052; cv=none; b=bGgHj0nNm8A595k69RdNh5xbjUWBzaCH+gNEGQa/BpXO/F/big7O0LCZgyBup0ZjYtca7MB/iDFUP9V8kMLEP7xObq1JiWCy4j9VHxw0rjydEaEPWaJrMg4rkLpBgVj5s0WQVuVOjM0aNJmWH7PtVRdhTr75Ltc1jktcuU9cYR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718368052; c=relaxed/simple;
	bh=RUe6gpCe5iEdSR8Dj65qOIzCUyK2a104M4xTeexY9IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLe48c/fvoEX4JfhtT43+M2erU+pooTNZUccqdxdPzk92mVxdqgVjeka0CzBjomZZjpxjbvluN55eWdleOSFPy5lwkSi1MDHIkpyZhcOUdD1RQt/aIbQU3CfOLg0TOMe6A7hgiSGulLHr050CWWtBN89OaMcW3LMtD1pjtjlzIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=osJHxERN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3913C2BD10;
	Fri, 14 Jun 2024 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718368051;
	bh=RUe6gpCe5iEdSR8Dj65qOIzCUyK2a104M4xTeexY9IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=osJHxERNZ3LkMySfC/wiOeUmYAXBJXmBhjw2K587C8uspNM6mV4e7p/1g7wwPnIgu
	 xkpvPbMYNXzJIg/ub56pvsiSP8x6/H2IOkim0e+VgMQqd0zkWxCjK6swXPiwWlxt5N
	 NH1E7uxY6lbBbmpFyM6GF2pGhddC4Vmutjvzhmxg=
Date: Fri, 14 Jun 2024 08:27:30 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240614-quirky-watchful-fulmar-a9bc50@lemur>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <20240614091949.GB3029315@google.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614091949.GB3029315@google.com>

On Fri, Jun 14, 2024 at 10:19:49AM GMT, Lee Jones wrote:
> > 1. disambiguates Link: trailers so they point to relevant online discussions
> > 2. allows tooling like b4, patchwork, etc, to reliably match commits to
> >    submissions for the purposes of better code review automation
> > 3. allows stable and similar projects to better track series grouping for
> >    commits
> 
> Sounds good to me.
> 
> So `b4 am -l` should be replaced with `b4 am ?`.

You can still use -l for this by adding this to .gitconfig:

    [b4]
        linktrailermask = Message-Id: <%s>

-K

