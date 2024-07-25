Return-Path: <ksummit+bounces-1476-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B1993C2B5
	for <lists@lfdr.de>; Thu, 25 Jul 2024 15:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 873B328258C
	for <lists@lfdr.de>; Thu, 25 Jul 2024 13:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E00C19AD73;
	Thu, 25 Jul 2024 13:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M9Q6rbiV"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE1132492
	for <ksummit@lists.linux.dev>; Thu, 25 Jul 2024 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721913268; cv=none; b=HAIHaidDw1/ejQwsI7a1Wrr0gfDFQk+HPmydxcSbUJ4ZuXSodN15rnP0gK4gCGSzmpzxM0sPkFOlpc1wNThcnDTYS8V9imZXQrryj/Sp+kSJ1NhB1oma7s5bEI/x/lSY8d73OSTTJRVV8+Hja4ryDvlFrUkNUlteHC7PR+SQ8m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721913268; c=relaxed/simple;
	bh=GQNUAy9smaBfC0emFUGiVO3wOvQ+72rMXfclbcNwZpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mapj4dy2s4+uJ7bF4Up66Doni1QJHDQCgU2N9Dd2HBWEFJGkZtdbX+PsjHnzQGWtqCIRJZHbz7r1jZJ2mBJZ8m79VpSl9HlcMfQjnkB70B1MjH1zqvrh3T/aBCZ1iFTINRDVfk8i5IyxBFvcXwzSvFREisf/QJaRMuKozKNaHds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M9Q6rbiV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E785EC116B1;
	Thu, 25 Jul 2024 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721913268;
	bh=GQNUAy9smaBfC0emFUGiVO3wOvQ+72rMXfclbcNwZpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9Q6rbiVrT/IPVjEG0zYAX28YKVX+buW6BKXYeEutnAofyGEDwysF6UcOLQhidUz7
	 v21/fk6hhK9ghKFebtDndIk3SPL8cUVUx28a90JBHObrbv3Y7wwE5JHm3lfGG87OC3
	 fZZc27SU4PvBwkaLyf4elCpIAEr5rx3jAR28r9pw=
Date: Thu, 25 Jul 2024 15:14:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mark Brown <broonie@kernel.org>, ksummit@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
Message-ID: <2024072530-clubhouse-polyester-091e@gregkh>
References: <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
 <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
 <c3071fa8-e64a-40a6-a725-4be1c668346f@sirena.org.uk>
 <d1b85ab5a4363457eef65096c7c1d0efe28b5e41.camel@HansenPartnership.com>
 <710867cc-fcc1-42e4-8946-34448a784afa@sirena.org.uk>
 <32489d2e9b88f0353e97f28bf1d8018aa7dd4265.camel@HansenPartnership.com>
 <20240625175131.672d14a4@rorschach.local.home>
 <2024062651-skyward-stowaway-6ea6@gregkh>
 <813a6d1d-586b-467a-b4db-30d3b5e022cf@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <813a6d1d-586b-467a-b4db-30d3b5e022cf@leemhuis.info>

On Thu, Jul 25, 2024 at 12:14:34PM +0200, Thorsten Leemhuis wrote:
> On 26.06.24 09:36, Greg KH wrote:
> > On Tue, Jun 25, 2024 at 05:51:31PM -0400, Steven Rostedt wrote:
> >> On Thu, 20 Jun 2024 12:02:21 -0400
> >> James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> >>
> >>> After all, given that stable is now delaying backports in the merge
> >>> window, there should be at least a 2 week period where .0 is it
> >>> (although it's also the two week period where we're not paying
> >>> attention ...)
> >>
> >> I'm curious. Is there a stable branch that adds the stable patches in
> >> continuously? That is, during the merge window, to have a branch that
> >> adds the stable patches as they come in and then when the merge window
> >> closes, to post the rc series with all the patches that have landed in
> >> that branch?
> > 
> > Yes, it's in the stable-queue git tree.  And in the linux-stable-rc tree
> > for those that can not consume quilt trees.  Been there for years...
> 
> Out of curiosity, as I seem to be missing something here:
> 
> Steven afaics asked for "continuously […] during the merge window" and
> the answer apparently made a few people (including myself) happy. But I
> can't see anything like that. Were you just busy with other stuff this
> merge window and didn't get around to pick up the changes, or did I look
> at the wrong place?

Ah, no, I read this wrong.  THere is no such tree that happens "during
the merge window", sorry, we are off doing other merge-window work and
not queueing up fixes then.

> I occasionally kept an eye on the trees you mentioned during in the past
> few days and the branches/directories for 6.10.y in stable-queue and the
> linux-stable-rc afaics have afaics been non existent until a few days
> ago before you started to prepare 6.10.1 -- and since that one was
> released ~20 hours ago those branches/directories do not contain any
> additional changes.

You are correct, I missed the "during merge window" portion.

thanks,

greg k-h

