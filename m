Return-Path: <ksummit+bounces-2539-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F645BE0EB9
	for <lists@lfdr.de>; Thu, 16 Oct 2025 00:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0475F483119
	for <lists@lfdr.de>; Wed, 15 Oct 2025 22:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B81306B01;
	Wed, 15 Oct 2025 22:22:43 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C0B201004
	for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 22:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760566963; cv=none; b=IzF+4EZvZVK3ZDNBMz7N2lcV5+xR+81Q4u7s29emi7xLED0EyhL4W6j5+nCvg4gHfbWAg1ThtJQIjSRdcw4qh40G9kt9/Y5YcQsiGmvD5ajJlTCjqGkXXOsO9bJmEqSfTzcMhU9MabBGwSbpfKW59PNha85TS46Qy11RxfdMJlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760566963; c=relaxed/simple;
	bh=Hg9v+O9N4TBaJ+6Wio5vmbU7e72HqXXD2QmITLzeMqA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qhaXTJT9q6nKWxFwEs09yf9dYdjSfmmaxcKZZVx+OxZhCi/8wQDu1wk56ygaug7aLuHyW3X85qvKJuJHpHkVNnCJpDKtQbDOrBwmggrZn80N6XBxTo3peWxQiEs5rewfLRQRk2Vc1gGM8/5pPqy/Z+ikNw3YUgfo562wl3mgG+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id E7F4647396;
	Wed, 15 Oct 2025 22:22:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 432CD2002C;
	Wed, 15 Oct 2025 22:22:37 +0000 (UTC)
Date: Wed, 15 Oct 2025 18:22:45 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, James Bottomley 
 <James.Bottomley@HansenPartnership.com>, "ksummit@lists.linux.dev" 
 <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251015182245.05c28887@gandalf.local.home>
In-Reply-To: <c311cf11f2e0bc2046c428e398508010c7626855.camel@sipsolutions.net>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
	<6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
	<8572506ccdaa6211e177d5976a74737268486492.camel@sipsolutions.net>
	<20251014153521.693907a1@gandalf.local.home>
	<c311cf11f2e0bc2046c428e398508010c7626855.camel@sipsolutions.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 432CD2002C
X-Stat-Signature: ju6kioqhd7zyn9896n9w9bq99pst63gz
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18MSrMJA2ixZZEx5NRRTryJlPh+qxzpCTU=
X-HE-Tag: 1760566957-915658
X-HE-Meta: U2FsdGVkX1+abz03xdjYXEw9NXioh/xGQIJTzsset4HMazs/7RC964oO1MJeN9V19T9kiykS3ZzsJfUtKjYuMpMLhgruK8gcH0F5WfLRhGEuVJrD95izYDOLTWyl/Y2I6ztuBO1olkLHLZuPSOsP9pxaC2so/DQ92fgWJdv3b/jZs3jjw0E9ZSDGoCOee91CZHGhQI7RPBN73SqQjACbb6mo4A7rpwpZr3rBu1/Qz2GW+w7LgiIcNJgXrUAXwlsJWNDBQzeiNz/SAHQLWqZEod2ce0BtAoGf2Kt0a8iq+7cdBk+jd+kAgx5SrdEgIJBwty4/ye5Xcd+u1DoNsmWrnnQyvDYjmDeS4HRg5l+RRLgSmgc7FIWPC0WY28fKPRd8

On Thu, 16 Oct 2025 00:01:38 +0200
Johannes Berg <johannes@sipsolutions.net> wrote:

> So yeah, circling back to "benevolent" -- for me, this has definitely
> broken the "benevolent" part and a lot of trust. But that's fine, I can
> also do a job that heavily resolves around following a manager's
> arbitrary whims. But my heart won't be in it.

Yes it does appear that we all have extra work to do because one person
doesn't like the current method. I don't think I saw anyone else complain
about the "useless" link either. Maybe I missed it. But currently it's all
been "Alright, fine, I'll work around this" and not one "Oh Great! This is
most definitely helpful!", like what happened when Linus created "git".

I'm currently looking for someone to help me with my maintainership. Masami
came on board, but what happened was that he basically maintains all things
"probe" related and I do everything else. That split still takes up more
time than we have designated.

Unfortunately, I've had many people say to me "I don't ever want to be a
top level maintainer" and "better you than me", which makes it very
difficult to find a helper. This discussion isn't helping with that
perspective either.

-- Steve

