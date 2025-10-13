Return-Path: <ksummit+bounces-2502-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AF2BD58BB
	for <lists@lfdr.de>; Mon, 13 Oct 2025 19:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 709E64E44ED
	for <lists@lfdr.de>; Mon, 13 Oct 2025 17:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBF73019C3;
	Mon, 13 Oct 2025 17:39:15 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C525BEE5
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760377154; cv=none; b=Pp4vawkSDerwPCJHYExQRLkMU7xy/a/ln8Vhqs/O6aOuk9Vff7SdH8o/sWBGbCs+UXqR3jlk+Vk+pyxotQFqvZZIsl3TtxDNI8ub7S4EDcPv5rgdfEEKpEr2xg0cHAyeZaf8NeAZi5qtdYrL+DLIj+E4WdlXvvAJjbH6hbxYQDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760377154; c=relaxed/simple;
	bh=MoSzbdRFSAdSqde51vMItPPyDzp3ty7+FcgFbn5Wf90=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BeOxEG1NgYkOV9N+C0ZxbDDvybxRHZB6yRAcPEFvMYK8H7sJ93TZHsUkhbwhK3lYm/bcnMM/TOlmewIAXFDN6PUfeFb/Gf2tA6N0wD1XvZyFcaLl+jNaB3dYpVld+bFm/G50FMKKpBJHQ1qVKWoI+0rAGzwsC1uXXCtRI8bWh/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id AE3B9C042D;
	Mon, 13 Oct 2025 17:39:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 288ED2000E;
	Mon, 13 Oct 2025 17:39:10 +0000 (UTC)
Date: Mon, 13 Oct 2025 13:39:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Doug Anderson <dianders@chromium.org>, "ksummit@lists.linux.dev"
 <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251013133913.015f253b@gandalf.local.home>
In-Reply-To: <c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
	<CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
	<c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: r4h3xngnwhsxso5w6nno68kjan1m1cme
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 288ED2000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18G8iJnLOcaJvTEOblaeaaFGznB0SKqsrk=
X-HE-Tag: 1760377150-657519
X-HE-Meta: U2FsdGVkX197I4olmzYQAm10c7EGS0k6mbhbWTEB0dUW2cAkPiOer0CKtwTD2Rp/7cppDgvqDuHHFXWiG9PsPrr0VLx+2SSK9vtud6ifPxlxHtpuVob6mhBUgJ8i5Nh223hK4MI5wlPLyslaCSl/HOp3MIv+6r1R7jQHaaKcdcwAi9F/bRHO/ienqkngnnMySiDdHpTZwIjuImlKThRTJ/uck8zJBTVUkiIeG7Ci7P/99dA7k6r24+DJIsgrml3dy7TOmUnkBtsnSCSfiGXQB5eaPq+lUaH2t/K1KmlQ6DFXlt7MElUj5Xy8vBRgaH5/G/hb7WWLbzVKl8SsoQm+dFn+0nKb7qaAhYCOGjzcAvyIAnIqsJmyFcilW2hYmWFK

On Mon, 13 Oct 2025 12:31:32 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> Just on this, git format actually controls the amount of information it
> prints from the headers rather than the trailers (the git tools are
> really designed to treat the trailers simply as body text).  However,
> that's not to say Link couldn't become a header tag instead of a
> trailer.

I just need it to be visible from patchwork.

-- Steve

