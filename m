Return-Path: <ksummit+bounces-2303-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50813B4941D
	for <lists@lfdr.de>; Mon,  8 Sep 2025 17:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3423C1BC0D3A
	for <lists@lfdr.de>; Mon,  8 Sep 2025 15:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CAE30F7E7;
	Mon,  8 Sep 2025 15:44:38 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB6D30EF99
	for <ksummit@lists.linux.dev>; Mon,  8 Sep 2025 15:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346278; cv=none; b=R+PqQ2ypOHu2kd5+aV0DaN/eA6o8OvVfgn/B4uI+VlFOpqFS5LqubwnJM+ceZAIB3WeVRyeDAgvX55ShUoUTH6qnNsunGk1UjsD4H5J64JzTcMzY9WCO4CWsOGmg/OSXEIZCK5SOhyPvBfNA6WJbjfclx3kyIfh1GqPelTHxwnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346278; c=relaxed/simple;
	bh=xz7krZowfcuHJGOkdc0L/GdA7b5AbhQH9FJ4aSEE8CE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aiDdCVYhI00bOK9uQILDo5q672inAW77ABY5DwnkZKRgyOB0cXOwFZm1O/NmmSPtNjJ6FHfltAUfowSJKEgLfqAPR/8M4TJ3OR4kQsfepOHN1HUnxaM7gdlAEWCfVtNBgsCNCSGzYFwKG++mm3p4/snwvxzXLfamau4lXuZRuwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 81DF01401C0;
	Mon,  8 Sep 2025 15:38:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id EA5FF20033;
	Mon,  8 Sep 2025 15:38:48 +0000 (UTC)
Date: Mon, 8 Sep 2025 11:39:34 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jan Kara <jack@suse.cz>
Cc: Coly Li <colyli@fnnas.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] re-think of richACLs in AI/LLM era
Message-ID: <20250908113934.1a31423a@gandalf.local.home>
In-Reply-To: <ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl>
References: <DC0B4305-C340-42C2-84B5-8C370794EBC2@fnnas.com>
	<ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: EA5FF20033
X-Stat-Signature: zkp43wmjksfiagsyfhradana8p47mqaz
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/UC6TUPzHcCepkC+J3QjBfH5IzGsmbnSM=
X-HE-Tag: 1757345928-77010
X-HE-Meta: U2FsdGVkX19K0k23A6/Dd7IS4e3RuZ1ylLop3UMXNCkXVBd/iZWxh6DtPLLvhOjNi0kwuyYhk2mFgjcNtWb1mRSsdVV542R4XjAbXLTfjZ9qeVrcCIGqeUFW0p9XW5FLVHWsROuTjlwf4QVOQnDmodPfzzBzTn9f+I2gSBw8jmwK9RFFWIv/LkWdX63HJECwMZCH/0bHOVvNILqHVjB7Zt+AMUi0N5hYxl99ZXg0Nb/zzUEZMk0Ct3GAk/YM/nsaQlRdoRKRlN/Sn1YeqnZxC4r3P4tltAVsttEB4XVQjfQ0D3bAiVnbQuL8LEKLCXxbU6rRqM3qDApzvm8rvBvesVjDZ7QLiJ/K7Glt4GoIG1xVrYmNVUbO8Wnl/huQsCAewqWr0llclpRxw9kmyrFxuQ==

On Mon, 8 Sep 2025 12:52:48 +0200
Jan Kara <jack@suse.cz> wrote:

> Hi Coly!
> 
> Maintainers summit is about process issues with the Linux kernel. Your
> proposal is for a technical discussion so it doesn't really fit there. More
> fitting would be a Kernel summit track at LPC which is for technical
> topics. Given your topic is mostly a discussion on a relatively specialized
> filesystem topic, I think the best venue for this would be LSFMM summit
> next spring where you get the biggest concentration of people that have
> something to say to this topic. (OTOH it's going to be in Europe so I
> understand the location needn't be as convenient for you as LPC).
> 
> I'm not really on program committee for either a Maintainers summit or LPC
> so take this just as a friendly advice from a bystander :)
> 

As Jan has stated, this is a technical topic. But you can send it to this
list too. From Ted's original email:

    Related to the Maintainer's Summit, the Kernel Summit is organized as
    a track which is run in parallel with the other tracks at the Linux
    Plumbers Conference (LPC), and is open to all registered attendees of
    LPC.  The goal of the Kernel Summit track will be to provide a forum
    to discuss specific technical issues that would be easier to resolve
    in person than over e-mail.  The program committee will also consider
    "information sharing" topics if they are clearly of interest to the
    wider development community (i.e., advanced training in topics that
    would be useful to kernel developers).

    To suggest a topic for the Kernel Summit, please do two things. by
    September 10th, 2025. First, please send e-mail with a subject prefix of
    [TECH TOPIC] to ksummit@lists.linux.dev.  As before, please use a separate
    e-mail for each topic.

    Secondly, please create a topic at the Linux Plumbers Conference
    proposal submission site and target it to the Kernel Summit track:

        https://lpc.events/event/19/abstracts

    Please do both steps.  I'll try to notice if someone forgets one or
    the other, but your chances of making sure your proposal gets the
    necessary attention and consideration are maximized by submitting both
    to the mailing list and the web site.


The CfP is closing this Wednesday, so please submit it soon.

-- Steve

