Return-Path: <ksummit+bounces-2394-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9641BB59B72
	for <lists@lfdr.de>; Tue, 16 Sep 2025 17:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 883BA46193E
	for <lists@lfdr.de>; Tue, 16 Sep 2025 15:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC8E369350;
	Tue, 16 Sep 2025 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/ZhZo2o"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AE634DCD7
	for <ksummit@lists.linux.dev>; Tue, 16 Sep 2025 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034839; cv=none; b=qFZJdxw96/9Naj3kkrrE5KdPuqGLjYDuWVW6M9gFC2LHQQf+H1pXWrBXUSFEHm8CrOV8T8xZzoSzTACeMQTNczbo6r0IZfPSq9N63yX12ItmmIw0r79zQ4pvyRJEFLxR+dHtumpcv00yWdb9bbUB57rp20dpQbWpx6Q9DgHPzho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034839; c=relaxed/simple;
	bh=octyHBkErxZZjT5GZjgyI1QviwQrCvJlmEP3QrjCyEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IblD06k659/5oR7OJC7e6aczWhV1UoDgqOH9mH5SQesexd8CL3aJqC1VUudyh/UpqjQLxxXev+79iKmFX/7WP5QD+JaqCYTZmrlGFg2ccNzl1Q2EFvNyMiHKUy8R4dAP8lGbHgZO9XEIEvqwWo9+y3B1ttEJ8c0ycDF87cjlU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/ZhZo2o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4213EC4CEEB;
	Tue, 16 Sep 2025 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758034839;
	bh=octyHBkErxZZjT5GZjgyI1QviwQrCvJlmEP3QrjCyEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/ZhZo2omlDJT6d0JNJlXIXpc+Z3uCceRGhJhAIYwYUrRiv4S0Ie07c4mNxikcDhz
	 qMzMoWZEWIzavNnOpjiCZc4Kn4FU2kArztazBk0ORtv6g8YezfuO+/rwV/8PLhcjbz
	 gwJ6cyjSihOQkwduYAz95NItVprS0pXOOYBLWXlm9ZIf8G8A/7uMXi3EVA94NbCLJV
	 ZJqmlKu5QiZr0YSgvbDLYQkFLTs/qFX0sBlH7+1dRZ/ZkF86rTP4NBM7nhPCOBS0Ar
	 Oa1I95gYR0Su3is3SwtkdvP36Sbxe1UQ62OJtLMYhavaOJEdXECVslNAVRn1lL6tnC
	 o1ltp+umH8rAA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uyXAb-0000000BHsb-1M8T;
	Tue, 16 Sep 2025 17:00:37 +0200
Date: Tue, 16 Sep 2025 17:00:37 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Kees Cook <mchehab+huawei@kernel.org>, 
	Jiri Kosina <jkosina@suse.com>, 
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <n3w52sm6d2gvbdhk34lamj52ihnspz5d2wgh4ojycr47rpvio5@ilamyahjnlmz>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <202509151019.CD7AA0C0BE@keescook>
 <20250916102022.5bc75a36@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916102022.5bc75a36@gandalf.local.home>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Tue, Sep 16, 2025 at 10:20:22AM -0400, Steven Rostedt wrote:
> On Mon, 15 Sep 2025 11:01:46 -0700
> Kees Cook <kees@kernel.org> wrote:
> 
> > So, what I mean to say is it's certainly useful to declare "I used a
> > chisel", but that for long running sessions it becomes kind of pointless
> > to include much more than a general gist of what the process was. This
> > immediately gets at the "trust" part of this thread making the mentioned
> > "human understanding the generated code" a central issue. How should that
> > be expressed? Our existing commit logs don't do a lot of "show your work"
> > right now, but rather focus on the why/what of a change, and less "how did
> > I write this". It's not strictly absent (some commit logs discuss what
> > alternatives were tried and eliminated, for example), but we've tended
> > to look only at final results and instead use trust in contributors as
> > a stand-in for "prove to me you understand what you've changed".
> 
> I don't think anyone cares if you used AI to help you understand the
> situation or to test your work. But if you had a robot build you the fish
> and you handed that in as your own work, that would be deceptive.

Agreed.

> Saying "this patch has been assisted by LLM $X" is quite too vague and I
> don't think that's necessary for most cases. It's only necessary if the AI
> created code for you that is beyond the normal "completion" (like filling
> out your for loop syntax). I like to use a quick sort example. If you ask
> AI to "give me a quick sort routine", that should definitely be expressed
> in the change log.

Agreed with the concept. Yet, asking AI to implement a quick sort routine
which is widely documented on several textbooks - or some other very common
algorithm with dozens of GPLv2 (and even public domain) code examples
is probably fine. Now, if one asks AI to implement the very latest fancy
sort algorithm from most recent published papers, then this is problematic.

Thanks,
Mauro

