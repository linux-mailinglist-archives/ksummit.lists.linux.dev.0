Return-Path: <ksummit+bounces-1308-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F6290B5C3
	for <lists@lfdr.de>; Mon, 17 Jun 2024 18:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E88621F21E56
	for <lists@lfdr.de>; Mon, 17 Jun 2024 16:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779261D9516;
	Mon, 17 Jun 2024 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dGDf25fg"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15D1E542
	for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 16:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718640378; cv=none; b=g45v41xGQ3lWgRGC3Mz6QY5QCB6uMCdHT2REYhgZcpKd+iHfTG8HrChSq50A3MwqVgPnl/gh8vmpAoC13jbEQTIp3HViFTTNOmYaU+49iumFvJNHH4bd5SVlyq4DT+R+GECHivn81DCFrmkaoIqlztGsdaS3y/OGsGfd8Rt6MeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718640378; c=relaxed/simple;
	bh=t0fKL7zBP/uNugsu/pMEuYslI8kWNSU7b8aMylKN8Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0qPcueMi7F8Bgdrfh3x/XdsRvNGchZ5QtyfzhpJLel6LlnJitI7EwCQvdXA/t0c3H5Y9acebqbxS9H/yajbkn6HUKBB8CVoLKCch17BwccGL7IPx+55ojDrWPs8qgyStFrvqilPPASp1I/X5gw9GH5cDVXr/2hB9eydadIYFDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dGDf25fg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F19C3277B;
	Mon, 17 Jun 2024 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718640377;
	bh=t0fKL7zBP/uNugsu/pMEuYslI8kWNSU7b8aMylKN8Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGDf25fgfLIgOhgf6NYbNfFj/yystJaa+YxDbM4EqfMs/YPBPgQ66dRuzapd+XgJu
	 CNtlF0hNQajXlhH9REdZdA4dczDlf/gR5cx//mOmVzWGwhdlRbbCMC6wU46uybhqpL
	 DG2+ZOjSd/eiIUdc8nHIEMoUiHrCAqMiNXV44t0g=
Date: Mon, 17 Jun 2024 12:06:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Takashi Iwai <tiwai@suse.de>, Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240617-inventive-bumblebee-of-champagne-e133bc@meerkat>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
 <20240615232831.6c7f27dd@gandalf.local.home>
 <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
 <20240617-arboreal-industrious-hedgehog-5b84ae@meerkat>
 <1ff23e26-0099-4826-bb79-4928507edce1@paulmck-laptop>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ff23e26-0099-4826-bb79-4928507edce1@paulmck-laptop>

On Mon, Jun 17, 2024 at 09:04:15AM GMT, Paul E. McKenney wrote:
> So for your message that I am replying to, this would be like these?
> 
>   - Link: https://patch.msgid.link/message@20240617-arboreal-industrious-hedgehog-5b84ae@meerkat
>   - Link: https://lore.kernel.org/message@20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # patch

The "message@id-here" means the entire message-id:

- Link: https://patch.msgid.link/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat
- Link: https://lore.kernel.org/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # patch

-K

