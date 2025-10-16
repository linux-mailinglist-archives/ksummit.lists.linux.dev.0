Return-Path: <ksummit+bounces-2550-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76799BE352D
	for <lists@lfdr.de>; Thu, 16 Oct 2025 14:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 193C84EE1A5
	for <lists@lfdr.de>; Thu, 16 Oct 2025 12:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382A13277B1;
	Thu, 16 Oct 2025 12:20:41 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256A32DECD2
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760617240; cv=none; b=D1/93/7rGVXMlf/SY2w5hwOip09+wZh/ZkW2wSlmA1s6eQcj119J9SSl5eK6zAF9LS/Ttzf0m2dqN3ynNwRTkFBpg6ySOltd5o0/qoho2pH7MSOPIblVUIFKJwjYpDaQdX2Q7n674/9GWqQO0C8vpDefl7KwKXoWRmsGc+mQESY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760617240; c=relaxed/simple;
	bh=27l2Nc12Dn1+Sm9cKaM9e8kdhgARbi0pRJtonuSzbF8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G8gUacDGeakpLFDdM2Z7FNo8IDsganO7XCqRLmA/PS/YxPadcigXSR6bnYVssF/GxtHz/WlBr4kOm35DOQlq5NeeAAi0OYGW31/V3HOJfIg0l7HC5i73BS5CCo9WUouBIR/AlnjNxkz578Jab0RpdvW0MJtKLFcr0jeAt6/H/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 36E97160310;
	Thu, 16 Oct 2025 12:20:36 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 4A1362002C;
	Thu, 16 Oct 2025 12:20:34 +0000 (UTC)
Date: Thu, 16 Oct 2025 08:20:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, dan.j.williams@intel.com, Doug Anderson
 <dianders@chromium.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, "ksummit@lists.linux.dev"
 <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251016082044.332607a4@gandalf.local.home>
In-Reply-To: <2025101631-foyer-wages-8458@gregkh>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
	<CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
	<68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
	<2025101448-overtake-mortality-99c8@gregkh>
	<68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
	<20251015-versed-active-silkworm-bb87bd@lemur>
	<CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
	<CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
	<2025101631-foyer-wages-8458@gregkh>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: kzsprozaozatibbffmn61tjpn6u9t6rt
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 4A1362002C
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19DliA30xb/GtjGU3nFiZrVncZ8tPEQO8w=
X-HE-Tag: 1760617234-477573
X-HE-Meta: U2FsdGVkX19e/OuJ5YWjlVHte9N6PmDt5O3lmFX1shhC27hjzxf6HTUTm5impzy0/uJ+cmZ95NH7xUq941aF58v0JejLCeY6QIb+nsRK9CUQTt5jW7tmyALvrUBveHw5AdZq/HOhY+r5JbujMdDvDaK78vx2oegiVwysU0j0mu5C3490Ti+YwBVydDnYd9+BSiFf31B1DMXkvo5otxEt8KsX+LdpEFQIUsHmQE7o/eSRTw3OftA745/JmwVnM/sdc4jI4fsy7PMn5aRuzgs2pmsWO4iEpBO+NbauwjlxfbuoKn3v9CK2qeRUiwyqRudmFkkMQdeQU9a+ToGWF3qHxX1h3Gj1wExBZFEjVWUK9qy7/ehU7dtwU65YRUgHik/l

On Thu, 16 Oct 2025 08:57:23 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> I predict that maintainers are just going to drop the Link tag and not
> remember to manually add it back, when touching patches, as that
> increased their already-limited workload (and again, prevents from
> applying patches without a good network connection).  And overall,
> that's going to be a loss in our source history for people trying to
> track down problems with changes in there.

This!

I already said that if I have to remove the "useless" links, I'm not going
to add any links. I do this and the daisy chain because others have told me
it's useful. If I have to do manual work for something I don't use, why
should I bother? Like Linus, if it doesn't work for him, why should I do
extra work at every commit so that it's useful for others, when currently
it's automatically added by my scripts?

-- Steve

