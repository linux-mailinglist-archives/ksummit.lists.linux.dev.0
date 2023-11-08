Return-Path: <ksummit+bounces-1197-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3872F7E5F9C
	for <lists@lfdr.de>; Wed,  8 Nov 2023 22:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE5D02815C9
	for <lists@lfdr.de>; Wed,  8 Nov 2023 21:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A855374D5;
	Wed,  8 Nov 2023 21:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jqf5Sp2z"
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69668374CB;
	Wed,  8 Nov 2023 21:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA05C433C8;
	Wed,  8 Nov 2023 21:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699477475;
	bh=vy7wFYk/8csAt5wbL5poDjFP9KeIxhUg5K0vUONV/gM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqf5Sp2zH0eGhMlwfHEY1Jlg++55CGwzXa7mQbpDWCdkFt3zHQSuVOWy7ZEx778ip
	 d/cdnAE7CRtzPdbbt1EH9r1SoaggEgcNZP1FwwP6l/B3arbYscGXlwaNRQ/jy3EutK
	 06b8gMyQ/WEC8aZZhEPa83o0vz24Qt8Qt/M0PE0s=
Date: Wed, 8 Nov 2023 16:04:30 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>, 
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]Re: [workflows]RFC: switching "THE REST" in
 MAINTAINERS away from linux-kernel@vger.kernel.org
Message-ID: <onqqlmhfzvw7xcrssntrhkykq3hxxabrswo4c5tiekjlvbzxkc@mqm4yrwthmko>
References: <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
 <20231108140415.46f84baa@gandalf.local.home>
 <985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
 <20231108143447.12d73140@gandalf.local.home>
 <20231108150749.13b7a0ee@gandalf.local.home>
 <fe239ff5c15403e418937cf23723017a803ec507.camel@perches.com>
 <bc0462f8119f83495ad35b2efdfd818797effb32.camel@perches.com>
 <88a5fb768bee48db508c366a0110e88b193d59a3.camel@perches.com>
 <20231108155606.4e73fdd5@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231108155606.4e73fdd5@gandalf.local.home>

On Wed, Nov 08, 2023 at 03:56:06PM -0500, Steven Rostedt wrote:
> I received the full message each time.

I think Joe managed to hit a bug in mlmmj-1.4.0rc2 -- I had it enabled on
ksummit. That was actually the other reason I'd started this conversation, as
a way to test it on a large-ish list. ;)

I've rolled back ksummit to mlmmj-1.3.0 and this problem should go away while
I troubleshoot what happened.

-K

