Return-Path: <ksummit+bounces-1427-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7257B931ACE
	for <lists@lfdr.de>; Mon, 15 Jul 2024 21:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20F5A284E42
	for <lists@lfdr.de>; Mon, 15 Jul 2024 19:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CF882D98;
	Mon, 15 Jul 2024 19:23:16 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C59D6A33A
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 19:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721071396; cv=none; b=ARWT/gjVZINW9dRUWK5sRxA4Mrd2OKQ5pN3Tx7TNCzhfnMt6d366xEnEZWuHVIbxAnRwk+iwPD6mWONyj9/NRFXXIefFPy9Odo+JpzAd4NSs4/O5sFMYyTCMfZLDZbCId7VuqBY1fRpB6VbEXftJLerLk6H3K7Vzx+nGOO0Q0aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721071396; c=relaxed/simple;
	bh=HwUVFXGUnTXYeJCzVE4wBkCQZJT+n5ynDgKXwp5YYX0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q7cKFKS7pPo3+WFRMvLnIbRlqYJg87iW8Tyo365DYF6QTXwn/BmWo3RuMzPZ2JBKLyjxy0ctSrNYOl6ZuwqjmqWXz7LK4UG0N3v2cGHgZXv6QmJ71xQ9IskvkbC3RtgJuzK7KrLBFrI5SVo6PShOKXbWt0iyjB1XFcdfE7LV1gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8EFC4AF0A;
	Mon, 15 Jul 2024 19:23:14 +0000 (UTC)
Date: Mon, 15 Jul 2024 15:23:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, James
 Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev,
 Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <20240715152254.4111182f@rorschach.local.home>
In-Reply-To: <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	<915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
	<ZpQbQa-_8GkoiPhE@sashalap>
	<f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
	<ZpQyeLFJY1gJvRRA@sashalap>
	<20240715180000.GC70013@mit.edu>
	<fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jul 2024 14:06:55 -0500
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> The one question I have is for patches which pre-date git.  I was told
> to leave the Fixes tag off in that case, but I think that's out of date.
> It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")".

That commit is the most common Fixes tag in the git history:

$ git log | grep '^    Fixes:' | cut -d' ' -f6 | perl -e 'while (<>) { chomp; $cnt{$_}++ } foreach $c (sort { $cnt{$a} < $cnt{$b} } keys %cnt) { print "$c $cnt{$c}\n"; }' | head
1da177e4c3f4 528
76ad4f0ee747 40
e1eaea46bb40 39
9cb837480424 20
9af6bcb11e12 14
99cb0dbd47a1 11
848440544b41 9
f91696f2f053 8
89d44f0a6c73 7
4ed8eb6570a4 6

-- Steve

