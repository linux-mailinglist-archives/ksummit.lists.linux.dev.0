Return-Path: <ksummit+bounces-2393-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CACC9B599E3
	for <lists@lfdr.de>; Tue, 16 Sep 2025 16:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 849F44E45EA
	for <lists@lfdr.de>; Tue, 16 Sep 2025 14:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDB2315D4A;
	Tue, 16 Sep 2025 14:19:25 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F04299A8F
	for <ksummit@lists.linux.dev>; Tue, 16 Sep 2025 14:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758032365; cv=none; b=JvNcBZX7uVw/jRHDGcINH7q8khATLOuVkJc3UNCiWlBEh/bSzzc32kobzA6QJGB38yaLkwelTWyxV1WMqIV9p2lIbYSPMBdyPnh8d5u+1FXUvReisZax6/fNHp3bZCILK4IUjgfZLl25QQ3i7aoZ5mCBWqT9oXz/px3PBGgt3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758032365; c=relaxed/simple;
	bh=Q7zYEKyl8SW0iTHds5kr+7Wbd6oIwxbiPZJYw43234Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBLJd08c0Hzb2vc3UPnO2K/vRGNqCp66Wd41rTd/cgc3L0wIxkO7ws6FeOVrjztxKIaBQO+Tt1VdbUXpaIqQpqHH+9acSC132NYCGZQwh0PY7/gifzGVUKhb1irZm/Ce22YS4R/81iWbhwBDnsJZeUtjGaxwJXJTcxxU1/eY/t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 86160B6F3D;
	Tue, 16 Sep 2025 14:19:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id D2A3A20028;
	Tue, 16 Sep 2025 14:19:19 +0000 (UTC)
Date: Tue, 16 Sep 2025 10:20:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kees Cook <kees@kernel.org>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250916102022.5bc75a36@gandalf.local.home>
In-Reply-To: <202509151019.CD7AA0C0BE@keescook>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<202509151019.CD7AA0C0BE@keescook>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: aon6q4ebjji9557jpipk4ehs5f9yk6m3
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: D2A3A20028
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19VGH1lCFlc0kJkvWbNiM6AzRaPFWlDdOI=
X-HE-Tag: 1758032359-971378
X-HE-Meta: U2FsdGVkX18EyDgjD78VwHXAl3+XBO4B8H6BMBHli/beep+BjkKtrNbXNnHHt74zUxtIgJZyQnKkXbySp+DUNFctQZZ4u8xMcosxU4SDwvGkcpzA3H/ucKkDVf8sI00yb04Vqs2EV8gp0/Y8R6sNCjj+4emRfis3jY7jW60d9dXy3dTCWhFvze7gRQ70pJ3tQBdOKRtIk6eexW1O4H+Q9/3dgGT1DdtUV+RMbzU2tUU1+UsNS3tCBnCDfqslxhb/qY21yFrYweoxR9AWXw4E+SJwN7/YQ8lSiWukk1aATLrzCvyWdexaacyzfGkuCXT5ETmjbxDSS4+3BYOAoYcHASt5ZeNEn5wD

On Mon, 15 Sep 2025 11:01:46 -0700
Kees Cook <kees@kernel.org> wrote:

> So, what I mean to say is it's certainly useful to declare "I used a
> chisel", but that for long running sessions it becomes kind of pointless
> to include much more than a general gist of what the process was. This
> immediately gets at the "trust" part of this thread making the mentioned
> "human understanding the generated code" a central issue. How should that
> be expressed? Our existing commit logs don't do a lot of "show your work"
> right now, but rather focus on the why/what of a change, and less "how did
> I write this". It's not strictly absent (some commit logs discuss what
> alternatives were tried and eliminated, for example), but we've tended
> to look only at final results and instead use trust in contributors as
> a stand-in for "prove to me you understand what you've changed".

I don't think anyone cares if you used AI to help you understand the
situation or to test your work. But if you had a robot build you the fish
and you handed that in as your own work, that would be deceptive.

Saying "this patch has been assisted by LLM $X" is quite too vague and I
don't think that's necessary for most cases. It's only necessary if the AI
created code for you that is beyond the normal "completion" (like filling
out your for loop syntax). I like to use a quick sort example. If you ask
AI to "give me a quick sort routine", that should definitely be expressed
in the change log.

-- Steve

