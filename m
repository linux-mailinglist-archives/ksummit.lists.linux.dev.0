Return-Path: <ksummit+bounces-1260-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9656E90806D
	for <lists@lfdr.de>; Fri, 14 Jun 2024 03:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB62D28412D
	for <lists@lfdr.de>; Fri, 14 Jun 2024 01:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D283D66;
	Fri, 14 Jun 2024 01:00:15 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1DB20E6
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 01:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718326815; cv=none; b=tP7AigrM1JVMGUV7f96MsS5FsdLX3+PdXdFg5kJ1Bug37ntcOB8R64gpjQSgiqJcCaKzCrDQEdwQMv9IiJZMeba/LDdj+1wc/EwmbsVqm/2cukzIlA16PT2/ppx5E4ZTCQvfhFJaTccu8enrnqiK81MJnX9ucr1MW5CQ2SG0Hh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718326815; c=relaxed/simple;
	bh=nn3sPd2yoRJx3mB2EIAoJg/QfNiwWVGNYzw/t/cbF4E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oFc5DW8nlQ/tjeAPrnzYDJ0Azm6NRe1UlVOFvdhbrOJEO7iK/FbDnIRaWy8N1tos5joi6JyLDZKZM6WYGaD20rmzp7WLzk5KMGxLNDogohpNGs57wPQaequH7t89qNOFyC+2y3MN9nXvHP7vqdyN+XZwN+V8V6LdUzdf1xhY93A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DF2C2BBFC;
	Fri, 14 Jun 2024 01:00:13 +0000 (UTC)
Date: Thu, 13 Jun 2024 21:00:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240613210012.0c4bbea0@rorschach.local.home>
In-Reply-To: <3226c18c-9f56-4f98-8b12-c51be4a68033@moroto.mountain>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	<e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
	<20240613095917.eeplayyfvl6un56y@quack3>
	<3226c18c-9f56-4f98-8b12-c51be4a68033@moroto.mountain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Jun 2024 22:39:48 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Thu, Jun 13, 2024 at 11:59:17AM +0200, Jan Kara wrote:
> > FWIW I (and a few other maintainers) use 'Message-Id' tag to link to
> > submission.  
> 
> These are great.  What I wish is that someone added that to Patchwork.
> 
> KTODO: Add Message-Id tag support to patchwork
> 
> (KTODO is like a when you say a wish and throw a coin into a fountain
> except it doesn't cost you a quarter).
> 

That would be great. I need to update my scripts. I pull from patchwork
and then run a script that adds the message-id, but makes it a "Link"
tag. Which reading this thread, I realize is wrong :-p

I'll go update it now!

(and repull some of my changes I'm getting for linux-next).

-- Steve


