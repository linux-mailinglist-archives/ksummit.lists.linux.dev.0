Return-Path: <ksummit+bounces-1359-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8849179D0
	for <lists@lfdr.de>; Wed, 26 Jun 2024 09:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B2DD1F214C1
	for <lists@lfdr.de>; Wed, 26 Jun 2024 07:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7307815B0FC;
	Wed, 26 Jun 2024 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qR6BiLLC"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB861FBB
	for <ksummit@lists.linux.dev>; Wed, 26 Jun 2024 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719387378; cv=none; b=r8RGBoyNFjkKnUe2VG1EKJiWoU39+BrH41aT7nVia26UPBKEP7IdLcp+zzOrIBhukEF/LUyqnTWH82MCSYqyAwwg4ZOF1sDOf1jySH9LF5pLG7tHdG2KRsI5HlSV0WJ2AOjrOfPAa7q7pwihYYh3H7PWL2vnW5BG/cqlXiy1iSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719387378; c=relaxed/simple;
	bh=jFWP5D2xS2uB3IWPXt4WJMJfk1TIMtTTMb1YHSedheg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NORpT97g6LPjn6h8H+XvsY4panyirNC8+F2uzMZ01eg1BVPAv4bshNzQfp/OhIslFdudkFvUMtgzNndonasTZNQq++Lq9DuBlHvqZqjkVMZs6NzPegEI3iKIVl8nnG7JxnaZJPGJz93xMBxmOcQwB/fI9uT1EUdj0JvOIq6/9WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qR6BiLLC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F68C2BD10;
	Wed, 26 Jun 2024 07:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719387377;
	bh=jFWP5D2xS2uB3IWPXt4WJMJfk1TIMtTTMb1YHSedheg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qR6BiLLCUF93ByrdFhOcJ0HeLV8ajhwlYMCjSxBDrGrxTPU9WBJKhsXKHox1A61CJ
	 1iiXhIYeHbqIhjoxwSDVM2qKN0K9QgHe+hQsSpFlgPfBILejlo0qX180SlHr094AiD
	 fy5loCYVgFHg3WTF9o3Xb11HWuj7iNM+6PFazuSM=
Date: Wed, 26 Jun 2024 09:36:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mark Brown <broonie@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>, ksummit@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
Message-ID: <2024062651-skyward-stowaway-6ea6@gregkh>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
 <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
 <c3071fa8-e64a-40a6-a725-4be1c668346f@sirena.org.uk>
 <d1b85ab5a4363457eef65096c7c1d0efe28b5e41.camel@HansenPartnership.com>
 <710867cc-fcc1-42e4-8946-34448a784afa@sirena.org.uk>
 <32489d2e9b88f0353e97f28bf1d8018aa7dd4265.camel@HansenPartnership.com>
 <20240625175131.672d14a4@rorschach.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625175131.672d14a4@rorschach.local.home>

On Tue, Jun 25, 2024 at 05:51:31PM -0400, Steven Rostedt wrote:
> On Thu, 20 Jun 2024 12:02:21 -0400
> James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> > After all, given that stable is now delaying backports in the merge
> > window, there should be at least a 2 week period where .0 is it
> > (although it's also the two week period where we're not paying
> > attention ...)
> 
> I'm curious. Is there a stable branch that adds the stable patches in
> continuously? That is, during the merge window, to have a branch that
> adds the stable patches as they come in and then when the merge window
> closes, to post the rc series with all the patches that have landed in
> that branch?

Yes, it's in the stable-queue git tree.  And in the linux-stable-rc tree
for those that can not consume quilt trees.  Been there for years...

thanks,

greg k-h

