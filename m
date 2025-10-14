Return-Path: <ksummit+bounces-2523-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F058EBDAD59
	for <lists@lfdr.de>; Tue, 14 Oct 2025 19:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C2621925853
	for <lists@lfdr.de>; Tue, 14 Oct 2025 17:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E2E296BA7;
	Tue, 14 Oct 2025 17:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="as1OUZq2"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2F027874F
	for <ksummit@lists.linux.dev>; Tue, 14 Oct 2025 17:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760464026; cv=none; b=ILB2dYq2DDUvS/8G/wwhkYl8HOvRZPYcS9B/ulrHXUI0m8Os1dWmt7kkHqAtwoLNPRR4EksIVFXspwtu9imqJMG4Pj4sxq7A8dZHABIfrjSaqwSZRsmo5pwb5bfPH0lnRrX0rs6Iah44KcDTyQ5Dk/wnIuCb6mfQfagtXEiECqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760464026; c=relaxed/simple;
	bh=QP0ljlzai8cAkTAZku866mvphYwMlyEd6giNb+QNytk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKRUIVlPeN5e0D+dF3ptm+3JLFAiEQ1ipdpVyLxH79zT/CPRBSa5NkAIOTuP/3TwU4yoJtPZ3p3gCEJF+y1HklDznoMFY31slbQkclNnN8XeQOmveIZPtSISCPMbwq2bVWMak95V7+RZ/XwFxoSBKl2SU4vUgRfnGIoAQIzfefk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=as1OUZq2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0106C4CEE7;
	Tue, 14 Oct 2025 17:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760464024;
	bh=QP0ljlzai8cAkTAZku866mvphYwMlyEd6giNb+QNytk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=as1OUZq27yYka4b4CDxMjsVAH7oruKWvqupvr8EU8zIJdLjPa6whzfz+DlxkeIVah
	 zzNi3IEWMBkfXUJKcCKJME4kXiZ5sbzNyzuZNGxPIMBWGn9/Sju55LtPfg0kN/MOuM
	 z/HQ+yorC55N/NafZSLthRnRoQD6nuWKVjcrnKq0=
Date: Tue, 14 Oct 2025 19:46:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: dan.j.williams@intel.com
Cc: Doug Anderson <dianders@chromium.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <2025101448-overtake-mortality-99c8@gregkh>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>

On Tue, Oct 14, 2025 at 09:01:32AM -0700, dan.j.williams@intel.com wrote:
> Doug Anderson wrote:
> > Hi,
> > 
> > On Mon, Oct 13, 2025 at 4:53 AM James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:
> > >
> > > There has been a lot of discussion on the tooling list about how the
> > > loss of link trailers has updated both tooling and triaging issues.
> > > Konstantin has proposed a tool to get around this, but while that's in
> > > development, I propose a discussion about making Link (or some
> > > alternative tag) into the pointer that would work for everyone.
> > 
> > A few random ideas to throw out there:
> > 
> > 1. Could we submit a change to the "git" tool to allow something like
> > the "Link" tag but hide it from the default settings? I'm thinking
> > something like how "git" only shows the Author/AuthorDate by default
> > until you say "--format=fuller" and then it also shows you the
> > Commit/CommitDate. Then we just tell Linus to keep the setting off and
> > everyone is happy.
> 
> A place to stash metadata that: stays out of mainline, is readily
> available to the subsystem maintainer and anyone interacting with the
> submaintainer's tree, git notes.

The "problem" with git notes is that for those of us working with the
"whole tree" at times, we would then have to go and dig across all
subsystems to try to find where the notes are.  So unless we have one
big "all the notes merged into one" tree somewhere, it's going to be
very unwieldy for many of us (i.e. all the distros/stable/release
people doing triage and bug reports.)

thanks,

greg k-h

