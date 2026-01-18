Return-Path: <ksummit+bounces-2781-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00164D397B5
	for <lists@lfdr.de>; Sun, 18 Jan 2026 17:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A1CC30056D6
	for <lists@lfdr.de>; Sun, 18 Jan 2026 16:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934E11FF7B3;
	Sun, 18 Jan 2026 16:05:07 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E4B171CD
	for <ksummit@lists.linux.dev>; Sun, 18 Jan 2026 16:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768752307; cv=none; b=AUwav5d2hDgW3drUXh/O64TQiayAHbmGoSIkTBoEnrPTCQwVAj5o7Ck2dwDE0UFoB9auGSky+bWmQrl8M/+f7nYnYCfkBMpgUe0VAOn7Rg3j2QM7Uxyl9PECNgMOinjKQyYSm/fQpcWePVMQuT2yhupkFL0L2XLYxHXXTHRg7TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768752307; c=relaxed/simple;
	bh=Ffo0W/ZOsqP785D+OFgx9XrayYUV+4phCNMC1hAClg4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T5uWMmI33KCVZLoAjOcun8d5KhjWVnUtjJDL+hD86HvZy9VzvFhw9gRCfJ/jVIUpF+sjBGbBsWx3w/dukx6LPpKrkGrbLRMt1l1fPHALbGsr2ajgmInXXoXzrfelwnF6jqd6j4r4hb1oj8cEyuUZGlF7Qq6beuYFw21mEwkdWZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 49F96C2079;
	Sun, 18 Jan 2026 16:04:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 45C252D;
	Sun, 18 Jan 2026 16:04:56 +0000 (UTC)
Date: Sun, 18 Jan 2026 11:04:54 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, Dan
 Williams <dan.j.williams@intel.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <20260118110454.4d51a50a@robin>
In-Reply-To: <38d7b19f-b6ff-437b-bc88-fa2047ca556a@p183>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
	<7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
	<aVUUXAKjiNroU5tR@black.igk.intel.com>
	<20260102095029.03481f90@gandalf.local.home>
	<38d7b19f-b6ff-437b-bc88-fa2047ca556a@p183>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 1m7io55whfohtayu8zgfem3s1jotkje4
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 45C252D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX183q7gpo5GToNE1rBgBYWjgpZSa90InMpw=
X-HE-Tag: 1768752296-667103
X-HE-Meta: U2FsdGVkX18SZqvtGF5pspEuSly3UVOleiNmijpoFlSUHOmt+BpS/rAqIgB+4KeszWETkpm6oCvBdMIj6l4zKEGDMCK3MfplAgqqVEgZUidADYVDHg4X06HVJpbN7f3MYBLeidFJsSGjb8kpIYzxUW7R7QkTN4b4z75woYDD55e1oiat5BdJTQQPsjgYHVsvtqBPNV5IY28sD/LUOLasOY3pXQ9DmqVpylfe8POh8y4jtQvGPOWaoKeRdqY2ekb6n8FD7l0RQhLhZPVtpOXMeA6hN6f98jzb1ptYWCA18w8gMIXY6vbCxdgXRA/cx9OuWHG5R7Svut2DVkNIv2unSYQT7rnM6/qi

On Sat, 17 Jan 2026 19:23:07 +0300
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> Such rules for headers are mostly harmless -- headers are supposed to be
> idempotent so ordering doesn't matter. But if ordering doesn't matter
> why have a rule at all?

As I mentioned, for aesthetic reasons only. If code is easy to look at,
it's easier to review. Especially for those with OCD ;-)

> 
> Duplicate header are trivially caught by tooling.
> 
> But such rules aren't useful either -- I've seen that Python IDEs hide
> import list by default (and probably manage it) because it is not "real"
> code.
> 
> Rules for initializers can be harmful because ordering affects code
> generation.

I agree. I still prefer the upside-down x-mas tree approach for
declaring variables, but obviously if they also get initialized, then
that trumps aesthetic reasoning.

-- Steve


