Return-Path: <ksummit+bounces-2654-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 762C1CABF51
	for <lists@lfdr.de>; Mon, 08 Dec 2025 04:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70084300BEF0
	for <lists@lfdr.de>; Mon,  8 Dec 2025 03:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6CF26F293;
	Mon,  8 Dec 2025 03:25:07 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0172F243954
	for <ksummit@lists.linux.dev>; Mon,  8 Dec 2025 03:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765164307; cv=none; b=u4bir61uyaQTuMwmKDP7IzKihN3FZi+4rosQrPVqvnjW8/OU33Ha4rujc1oHP7QcI1clAFvxztuwJge8UbuRZx0C4bl0PxXzoGbowm3a9flQGp7sxxHYQ7rHWOyeCBUn71er2rjWbR+DmVvF6YfRjeG3uGGBoFELxl0zBdFCg44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765164307; c=relaxed/simple;
	bh=HvNAukEK9mHTBIT/kYPBbQq9NqDqVDDie3M9Kb0fsBY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IB+zoxeULN26M9KS+Zw/iGZBuXeuFyvVdwhTc3ENH97NU/bsy6qN3KUoIlEyGaOZtnRjeG3hbbSSFIMtZCUiQPPv7A6L2poJYrqgooB930TZWgrJo0XS0DrRB2H0Vz0rft4gLn08jM65ElD5j4P93cGXmaQAH5CYQPYpcZoHC0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id C3A7C140994;
	Mon,  8 Dec 2025 03:15:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id 1EAD380012;
	Mon,  8 Dec 2025 03:15:36 +0000 (UTC)
Date: Sun, 7 Dec 2025 22:15:32 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Sasha Levin <sashal@kernel.org>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <20251207221532.4d8747f5@debian>
In-Reply-To: <87zf7tg2dk.fsf@trenco.lwn.net>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
	<aTYmE53i3FJ_lJH2@laps>
	<4BDD9351-E58A-4951-9953-00F1E9F24FB4@zytor.com>
	<87zf7tg2dk.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 1EAD380012
X-Stat-Signature: hn87gyf1hnd6unhakcsgm9q3gof3mz9q
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+C8tsL8KgMkTVL/dsIXsRe2/sr80Bb+fg=
X-HE-Tag: 1765163736-264634
X-HE-Meta: U2FsdGVkX19sJLY85+HDleEhmGzOjGWXM7Na99i3yKNWUfI+J7kq5VAwOUTDC0H5Jve/BIjAkbjp7kbAGULq/WspXWIgDxerTTpH3nNcGonp9pPiq9G98SbzJgNw0RXFIjL0bY/StqEWJVsZ3zAs9AJfZpZRw6neu6zGEpuKhUZVOSyjXeZ4tLxybJJhncXvYVVTfTr0lRfdsyEU4b4ereOQUZvObtKWSkOnLG+rPxLVOzOur1uVaCN9qUY8ygXdyQGepglr8m5hkds7bQ9j9hgC9SJd84Xikuw+aDfjKWlF1tKxjRM41w5lqLTT/aXLZOEHD1+Tcgo1BIpzLaOQDXGo59pAVXRKjugdDWRC4yvf4di1V38PTbixOvAQIK5fEBmkie3/eCk8sngwr/kHKe05/4wAmmys

On Sun, 07 Dec 2025 18:59:19 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> > I contend there is a huge difference between *code* and
> > descriptions/documentation/...

> 
> As you might imagine, I'm not fully on board with that.  Code is assumed
> plagiarized, but text is not?  Subtly wrong documentation is OK?
> 
> I think our documentation requires just as much care as our code does.

I assumed what hpa was mentioning about documentation, may be either
translation of original text of the submitter, or AI looking at the
code that was created and created a change log. In either case, the
text was generated from the input of the author. Where as AI generated
code likely comes from somebody else's code. Perhaps AI was trained on
somebody else's text, but the output will likely not be a derivative of
it as the input is still original.

In that case, I agree with hpa on this.

-- Steve


