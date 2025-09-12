Return-Path: <ksummit+bounces-2383-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B77EB5558F
	for <lists@lfdr.de>; Fri, 12 Sep 2025 19:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4F4B16C6DB
	for <lists@lfdr.de>; Fri, 12 Sep 2025 17:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC436324B2E;
	Fri, 12 Sep 2025 17:44:42 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3430431D39D
	for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 17:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757699082; cv=none; b=Fjj5C+0A8MQQU/tJVX+bZk9N4kTfxe2Qf3kCzlAIg4tuUA1klkBxR876NLsqtb1gSWpWvW3USTPZo6xVCpX7RpcfpGWT00sx5p6mrExAd4+W9N/lbHl7QtEd7fmzeTLmAG+BFSl9t0CuhWsM1+G9vqIfmUEkV6TemRJNYgR5x90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757699082; c=relaxed/simple;
	bh=EdaPQljbcCLRXohEUQXkQK7qWIS5YqNgWLRouReDGjI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=svnbGXDHlHBr4sW9J3wlzX7r9uKzt/kFx0NYzRRagtpVvc9BDefh3Yvxv33mUcCbHOWyOy3BwvjyaQ4ClldC0IlECOqO2tgYQ4/H/J5r8xTtt1z8/2jkh/fRYx8cbJ9R5ZJ0aVnVyuY9jdtJEnmYcS1/dhJppLNw3kZRRQUy4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 5FD6B5BB1A;
	Fri, 12 Sep 2025 17:44:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 90DFF2002A;
	Fri, 12 Sep 2025 17:44:30 +0000 (UTC)
Date: Fri, 12 Sep 2025 13:45:25 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Mark Brown <broonie@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <20250912134525.24a22559@gandalf.local.home>
In-Reply-To: <68323a1d-eb5e-4a45-811b-653555cbf7c5@suse.cz>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
	<20250911122711.GC8177@pendragon.ideasonboard.com>
	<e7a60ee9-77fe-4729-a58d-441543792de7@sirena.org.uk>
	<20250911102506.43ee7f9c@gandalf.local.home>
	<68323a1d-eb5e-4a45-811b-653555cbf7c5@suse.cz>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: fcbyhaz3zuu8uknuezff71bphkbtsree
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 90DFF2002A
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX199v3Chi32wIecRNyzAHBdGvpjiYv8fZEY=
X-HE-Tag: 1757699070-695213
X-HE-Meta: U2FsdGVkX19g/kTypwt1ZOM97MbIgWNDTvWs9Bsu/1YsDpAJ5I9bfckCd9Wx5mn4yfAx67Bj4kKyl8iz32brl7i6ZLPNT4zsj7OYq0NWeJVKUdOKRUSvoilCiDnONxT4fjxPxGa/Pwfup1o4iURYxVMYLrZhxfRK8tIXoPPfrzGPyOdz5KY1TtSe0UJ7305aJ8KGBjR29LEnkqLUu9TJW4Pv7uNI6VqcvmHR/416jJv0ylKLPRFBPpf8T/5B/U0qvsiHZ2krcXeC/rNLaheZjORWCn9sayXIQi5dOcEul4cG4IYsa8OGE43SJ6tGtKyK

On Fri, 12 Sep 2025 11:52:18 +0200
Vlastimil Babka <vbabka@suse.cz> wrote:

> > In these rare events, I will apply the change to one of the topic branches,
> > then merge it into the other with a detailed explanation to why I needed to
> > do that merge.  
> 
> Could you alternatively put the commit in a shared base of the two topic
> branches, and thus avoid the merging? Or it is a case that you don't want to
> rebase (at the moment because merge window is near, or ever?), or the change
> can't be moved ahead of the other work in those topic branches?

Once I start pushing changes to linux-next, I try to avoid rebasing. That's
because my changes have already been tested, and others may be building on
top of them. In these rare cases, there's changes that are added to two
topic branches where a single change may be needed for both. Or more
realistically, a change will affect two topic branches (like a common
function that has its prototype changed. I may change it in one branch, and
then the other branch needs to use it too).

In these rare cases, I just add the change and merge it to prevent rebasing.

I also wait until the later rc releases to start pushing to linux-next to
limit these conflicts. I try to push around -rc4, but I'm a bit late, and
I'm going to be pushing around -rc5 and -rc6 this round :-/

-- Steve

