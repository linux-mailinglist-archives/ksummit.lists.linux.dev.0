Return-Path: <ksummit+bounces-1430-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 452AD931B06
	for <lists@lfdr.de>; Mon, 15 Jul 2024 21:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E26DC1F22C0E
	for <lists@lfdr.de>; Mon, 15 Jul 2024 19:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DDC481D5;
	Mon, 15 Jul 2024 19:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="PIcqTptt";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="PIcqTptt"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E803C6AB8
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 19:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721071832; cv=none; b=ObEYcT/9rIMJbq/hgA714tIliDCV+bOXfVHpZyuW9VwCVVpV/xmI3TG9Yc/yviuTURbbn3pXrJW0O7dgm/y3HRBZZaUw8JZsN4s5eH9NXS54wcE4NKMip+SF01c9x+OjuqfeVdrkxIr07xlxn6RZVMBBwXlwgCfHW95qOqSX1dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721071832; c=relaxed/simple;
	bh=xsoWPNLpopjDbhCiV5pYWD4cCJsCeW6awhQvtPzoW24=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YOX5+wESRIYnkr7gR3AAwUUemNuccIX2q8kHbPkEpU2M41FZvBUZy90bpL7xp6OpCAzgHKQENItPtdzLMqJa1mBXeQ+9dkpczplm0IOGMoSQv6Jx9G/b3gsN9jz2mvbAPcQmg4W7NeZtKqwpChF24aOHqo0Sz0bw25K5fO78Aco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=PIcqTptt; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=PIcqTptt; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721071830;
	bh=xsoWPNLpopjDbhCiV5pYWD4cCJsCeW6awhQvtPzoW24=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=PIcqTpttN+4t8AZACCM38kR9rKtObys2vxVMxbi1ujLcPNZzuOXe9JJMY9KkJVXez
	 RbmydWFwduzPB8tTF7Gck26flO3V4UbPtE1t2AV2qwZUuMv0wvFM7v9rvSOca/p+cr
	 JAjnCV6qdLkClBHrvw4IbptEtZtaVMZa+uG3WwrQ=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 4D12812868E0;
	Mon, 15 Jul 2024 15:30:30 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 0f3HEAiSq6JP; Mon, 15 Jul 2024 15:30:30 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721071830;
	bh=xsoWPNLpopjDbhCiV5pYWD4cCJsCeW6awhQvtPzoW24=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=PIcqTpttN+4t8AZACCM38kR9rKtObys2vxVMxbi1ujLcPNZzuOXe9JJMY9KkJVXez
	 RbmydWFwduzPB8tTF7Gck26flO3V4UbPtE1t2AV2qwZUuMv0wvFM7v9rvSOca/p+cr
	 JAjnCV6qdLkClBHrvw4IbptEtZtaVMZa+uG3WwrQ=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 8AEC91286849;
	Mon, 15 Jul 2024 15:30:29 -0400 (EDT)
Message-ID: <1b2331cbe0bfdcc6343d673ad65a9571d2005c38.camel@HansenPartnership.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Theodore Ts'o <tytso@mit.edu>,
  Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev, Greg KH
 <gregkh@linuxfoundation.org>
Date: Mon, 15 Jul 2024 15:30:28 -0400
In-Reply-To: <20240715152837.75c3845f@rorschach.local.home>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
	 <ZpQbQa-_8GkoiPhE@sashalap>
	 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
	 <ZpQyeLFJY1gJvRRA@sashalap> <20240715180000.GC70013@mit.edu>
	 <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
	 <2d787d2e12b336f94afe5549cbfef4e1e20d9a7f.camel@HansenPartnership.com>
	 <20240715152837.75c3845f@rorschach.local.home>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2024-07-15 at 15:28 -0400, Steven Rostedt wrote:
> On Mon, 15 Jul 2024 15:24:42 -0400
> James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> > On Mon, 2024-07-15 at 14:06 -0500, Dan Carpenter wrote:
> > [...]
> > > The one question I have is for patches which pre-date git.  I was
> > > told to leave the Fixes tag off in that case, but I think that's
> > > out of date. It's more useful to say "Fixes: 1da177e4c3f4
> > > ("Linux-2.6.12-rc2")".  
> > 
> > Actually, we have a history tree (based on Bitkeeper) that goes
> > back before that:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/
> > 
> > So I'd tag these as
> > 
> > Fixes: 3bc0a5f5c1 (history "ext3: reservation info cleanup")
> > 
> 
> I don't think that is necessary. If something is found to be broken
> from before 2005, I don't believe it's worth the effort to search
> another tree for the actual change that introduced the problem. When
> you go that far, it becomes only an academic exercise.

Some people are naturally curious, so it makes sense to have a format
for them even if we don't require everyone to do it.

James


