Return-Path: <ksummit+bounces-1225-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC209056CF
	for <lists@lfdr.de>; Wed, 12 Jun 2024 17:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75F07B2443E
	for <lists@lfdr.de>; Wed, 12 Jun 2024 15:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33F917F396;
	Wed, 12 Jun 2024 15:26:24 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9FA17DE31
	for <ksummit@lists.linux.dev>; Wed, 12 Jun 2024 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718205984; cv=none; b=caJYkH7pYvsnZccfpmPowmNqH6LV+9EOJ+JfonajCwb008XgrQeCozvaKULlu/N0uzdcMH5mhNSfq8NV2aIzkLqqcUodj5/ZS1gTlcdFbZ48XaCNOO1s901o7LYnYJwV5GDBDOwsH4iGO0TkS9Qe+ic/QudXTRhSiVYdb5o+V1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718205984; c=relaxed/simple;
	bh=wXHmrh2aia5ugTAsx6TS6aLcmglFmWaujs4D+/7LRUw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZwMCURCR+Jv6oJ7is/4MXz0tc3kBvxygtnDTN5Cyp4oCIUEWlwKQ7hKd709ea0TgBzipDBZfGSX1mbVkxE6JxF3cv6Ivkpg+XsBQFEcnfEiwQ10S47KHOOUM7G9qyW3MbX+OcEEv2f2REyyjwYxBlXxD5CKRaJMwoS7tOpymgKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EF8C32786;
	Wed, 12 Jun 2024 15:26:23 +0000 (UTC)
Date: Wed, 12 Jun 2024 11:26:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [TECH TOPIC] regressions: our workflows are the biggest enemy
Message-ID: <20240612112622.21bf7c89@rorschach.local.home>
In-Reply-To: <5182e50a-3d13-4edc-8f2a-a024e0588177@leemhuis.info>
References: <5182e50a-3d13-4edc-8f2a-a024e0588177@leemhuis.info>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Jun 2024 08:34:42 +0200
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> The talk among others will describe why some workflow patterns are what
> frequently leads to regressions -- and why they are also a factor why
> some subsystems fix regression quickly, while others take weeks or
> months to resolve.

The above looks more than a TECH TOPIC. If you have real numbers that
point out workflows that are an issue, I think this should be discussed
at Maintainers Summit, and perhaps we should start "encouraging" people
to change their workflows. Especially if we have hard data showing
that it's not working.

/me hopes he's not one of the ones with a bad workflow!

-- Steve

