Return-Path: <ksummit+bounces-1362-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C17918E9C
	for <lists@lfdr.de>; Wed, 26 Jun 2024 20:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE692B20E14
	for <lists@lfdr.de>; Wed, 26 Jun 2024 18:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35B018FDB8;
	Wed, 26 Jun 2024 18:32:33 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4306E611
	for <ksummit@lists.linux.dev>; Wed, 26 Jun 2024 18:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719426753; cv=none; b=J195cmb+c1l+9FEP3h12qrsUe8+k2d4XGlTIJBaF0u2NYYLxakuu/VqmUSYk9GeUMo6CdTCM1fK6GIrQ1Om25vbQHnTTpuVU3P1Lb2o5PqQrFLvCPOX3dL+31vmUnQc9jzhG17+tbVM9VIlbaSsD2dHDSCk8C6CNT0MJlAxJ9oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719426753; c=relaxed/simple;
	bh=QPPWPQL11VHMGMu9Gi6pZ2sTx3enDTzAWi5Pk7fu+9w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MuZDr7yvaInc3VDaKdJqe2mYl5HprjxMsotn0FapVuW5/FHR8pM4lV2eosCoo2UQoPVjvfC3RZ1hN3L0kUUapfG3b0UUUY5dludW5gfeNMVlIP5UIgGSKrsdwm4Kg+BIHQbKgQ/SdIPqWqUV1iFzs6J2+zarSNKAdiSYNb9R24E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F907C116B1;
	Wed, 26 Jun 2024 18:32:32 +0000 (UTC)
Date: Wed, 26 Jun 2024 14:32:30 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Mark Brown
 <broonie@kernel.org>, Thorsten Leemhuis <linux@leemhuis.info>,
 ksummit@lists.linux.dev, Sasha Levin <sashal@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
Message-ID: <20240626143230.192ebcdf@rorschach.local.home>
In-Reply-To: <2024062651-skyward-stowaway-6ea6@gregkh>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	<54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
	<c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
	<ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
	<c3071fa8-e64a-40a6-a725-4be1c668346f@sirena.org.uk>
	<d1b85ab5a4363457eef65096c7c1d0efe28b5e41.camel@HansenPartnership.com>
	<710867cc-fcc1-42e4-8946-34448a784afa@sirena.org.uk>
	<32489d2e9b88f0353e97f28bf1d8018aa7dd4265.camel@HansenPartnership.com>
	<20240625175131.672d14a4@rorschach.local.home>
	<2024062651-skyward-stowaway-6ea6@gregkh>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Jun 2024 09:36:22 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> > I'm curious. Is there a stable branch that adds the stable patches in
> > continuously? That is, during the merge window, to have a branch that
> > adds the stable patches as they come in and then when the merge window
> > closes, to post the rc series with all the patches that have landed in
> > that branch?  
> 
> Yes, it's in the stable-queue git tree.  And in the linux-stable-rc tree
> for those that can not consume quilt trees.  Been there for years...
>

Perhaps we should be encouraging people to download the linux-stable-rc
and start testing that more?

Just because it's been there for years, doesn't mean people are aware of it.

-- Steve

