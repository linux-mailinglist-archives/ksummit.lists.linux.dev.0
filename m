Return-Path: <ksummit+bounces-2503-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 50536BD599F
	for <lists@lfdr.de>; Mon, 13 Oct 2025 19:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F107E350D6E
	for <lists@lfdr.de>; Mon, 13 Oct 2025 17:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9FB27FD52;
	Mon, 13 Oct 2025 17:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="FL2Jjl4d"
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486D01A9B46
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760377842; cv=none; b=NwDb6uVE+j1kdP5FMrleWRQ684W/e/4fXFAPk3Mp5KYvzVoMFL3VB67pmoTdHQm8sqt33uO8XmlrITNbE0nGkOviPnenntJFS/m8vPH24Bkp1CbfEFkTxj78r/iz19KoaiU019Kfaz0NaC6RboKnGmF6Hx1kGrTdDWg/+K7J5sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760377842; c=relaxed/simple;
	bh=L8ijge3TkPgpP484xjFtwF7XwsQAoH/7Z1jZwlit1cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HK+lTNuu3FtvGeezkJQTrgH0PinhTj4+I+xx7OPQjhCI++3uKnsdn4W9tPzFFsIkEMaa79xcKpnMyeuoZmKYSl0RRMt1QQXPUe2eZgronEQPISuMyOlDlG1t/j/MvDIdpODwbo0S6vEdk8qCeVsW0DnHW93rotPDlOT0h13S8w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=FL2Jjl4d; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-82-170.bstnma.fios.verizon.net [173.48.82.170])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 59DHoVDr000652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 13:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1760377834; bh=0MeCZreb44PbBzVF/n/bygz5PyXMMTRinrcucn5xlxw=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=FL2Jjl4dbXMPSo4PqB0gkYRbwIj8bawm7wv+SINYvewEhWES11bvzA0ermUgQxL+G
	 XwMR/koLjGYie4quKUzcoLRTE3UsoYVxr6M/PmosU3qxRkjKHitdoJI7xw4WdSfl8Z
	 eyXRKJXqHsmfuk4V1MsEVUEb+KaxJf26CRK7/wC6y+DvlqV530Q8W1KI0XA/a+wGUn
	 gyvpxafhvzKmi4ncqnBBwaoY/SdAUgzXEMVF1NaIc9R71xRVqqhNmQOTDko8IqPrjO
	 NF90m8RZ+9ok+olC/VHqliU4PyM7JPYfneP5ghQiYI5VwhxsuJ9PDEOJwag/M37dl6
	 1WFw5sT/Uw5gg==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 637792E00D9; Mon, 13 Oct 2025 13:50:31 -0400 (EDT)
Date: Mon, 13 Oct 2025 13:50:31 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        Doug Anderson <dianders@chromium.org>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251013175031.GJ354523@mit.edu>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com>
 <20251013133913.015f253b@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013133913.015f253b@gandalf.local.home>

On Mon, Oct 13, 2025 at 01:39:13PM -0400, Steven Rostedt wrote:
> On Mon, 13 Oct 2025 12:31:32 -0400
> James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> > Just on this, git format actually controls the amount of information it
> > prints from the headers rather than the trailers (the git tools are
> > really designed to treat the trailers simply as body text).  However,
> > that's not to say Link couldn't become a header tag instead of a
> > trailer.
> 
> I just need it to be visible from patchwork.

Instead of the Link: tag, would this suffice for you?

    Message-ID: <20251007134936.7291-2-jack@suse.cz>

In some ways, it's easier since raw the message Id is directly
available in Patchwork.

						- Ted

