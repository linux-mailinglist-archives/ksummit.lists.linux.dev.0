Return-Path: <ksummit+bounces-2304-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F6FB49452
	for <lists@lfdr.de>; Mon,  8 Sep 2025 17:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 747164E11F7
	for <lists@lfdr.de>; Mon,  8 Sep 2025 15:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EBF2F1FE3;
	Mon,  8 Sep 2025 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="wdr8DlxP"
Received: from va-1-15.ptr.blmpb.com (va-1-15.ptr.blmpb.com [209.127.230.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D470F30CD80
	for <ksummit@lists.linux.dev>; Mon,  8 Sep 2025 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346876; cv=none; b=O/JF9ZwkuZhO3N+KL4QQWoeMn4+56DzABZs45+QtRFmsFMa/KqyqPW07HJYm1TzMQNCTmo+o6LqCmzmPQWsDtL1m26+Sf7X46w3IzwkGaPTq6OyA7LSMh1m6xHJThKFTPTNp4glLANW+MGIjUdQCeiZ3j1G7PfaFp4fjtOXWFFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346876; c=relaxed/simple;
	bh=fxeeW8b/Nqqr3dvWWWUk/ShCOH+r0Y52soQoQN2IIEQ=;
	h=In-Reply-To:To:Mime-Version:Content-Type:Message-Id:Cc:From:
	 Subject:Date:References; b=E3VthDS0tXwTKxAcowSO/YbEipY+Qxr7hcZ3oFviq3Urhg9Rss66bfIIrg5xstDBt0dqemSmWefLV4n2BDCIWSS/kG0Ad98N2KALHuHyyjW1XKYXUmKFgerprRWeTkPcPW6edH9vVJbI5gbj/4YTgDW2zCUiIT+U8aniutWLlZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=none smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=wdr8DlxP; arc=none smtp.client-ip=209.127.230.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fnnas.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1757346142;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=MyqavWkie1987hiIR+ROpHN+m26PEsZXH5yIsiFIvh0=;
 b=wdr8DlxPx4Q+O8wYwOWYYQbjvGdjUxPDklLr2rUHR6Ul4Io5UUtZLPUyHMTE7em3ARpHBL
 QYnWzsZzXx6vbkmPT7JeHWu8taLbJsAY2b8a9JPydQqDJCl+VS2gy5w9+/v2FmqPTYbLSi
 wEryWICcqp+nIPVyg0A3A/y++Gw+XoGK2a8eOlVEZL+SHOHnG7zvfxRUg26TE51TscfPcX
 81WPEokvW84Hhdf0eRlE4Odp42ldb8zNv97XA5KBpaEpPwem9/knXzoww986jjXCqeWHVR
 fVfGNFkUMG4GYcSxvXU+unF5Vd4WplPRaO1z7pXXYXrr7NsoVzcXyBAp99y/MQ==
In-Reply-To: <20250908113934.1a31423a@gandalf.local.home>
X-Mailer: Apple Mail (2.3826.700.81)
X-Lms-Return-Path: <lba+268bef95c+6508fe+lists.linux.dev+colyli@fnnas.com>
To: "Steven Rostedt" <rostedt@goodmis.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Received: from smtpclient.apple ([120.245.64.195]) by smtp.feishu.cn with ESMTPS; Mon, 08 Sep 2025 23:42:19 +0800
Message-Id: <E5FD7630-3474-4F02-A4F8-A1C11DA7672A@fnnas.com>
Content-Transfer-Encoding: quoted-printable
X-Original-From: Coly Li <colyli@fnnas.com>
Cc: "Jan Kara" <jack@suse.cz>, <ksummit@lists.linux.dev>
From: "Coly Li" <colyli@fnnas.com>
Subject: Re: [MAINTAINERS SUMMIT] re-think of richACLs in AI/LLM era
Date: Mon, 8 Sep 2025 23:42:09 +0800
References: <DC0B4305-C340-42C2-84B5-8C370794EBC2@fnnas.com> <ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl> <20250908113934.1a31423a@gandalf.local.home>

> 2025=E5=B9=B49=E6=9C=888=E6=97=A5 23:39=EF=BC=8CSteven Rostedt <rostedt@g=
oodmis.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Mon, 8 Sep 2025 12:52:48 +0200
> Jan Kara <jack@suse.cz> wrote:
>=20
>> Hi Coly!
>>=20
>> Maintainers summit is about process issues with the Linux kernel. Your
>> proposal is for a technical discussion so it doesn't really fit there. M=
ore
>> fitting would be a Kernel summit track at LPC which is for technical
>> topics. Given your topic is mostly a discussion on a relatively speciali=
zed
>> filesystem topic, I think the best venue for this would be LSFMM summit
>> next spring where you get the biggest concentration of people that have
>> something to say to this topic. (OTOH it's going to be in Europe so I
>> understand the location needn't be as convenient for you as LPC).
>>=20
>> I'm not really on program committee for either a Maintainers summit or L=
PC
>> so take this just as a friendly advice from a bystander :)
>>=20
>=20
> As Jan has stated, this is a technical topic. But you can send it to this
> list too. From Ted's original email:
>=20
>    Related to the Maintainer's Summit, the Kernel Summit is organized as
>    a track which is run in parallel with the other tracks at the Linux
>    Plumbers Conference (LPC), and is open to all registered attendees of
>    LPC.  The goal of the Kernel Summit track will be to provide a forum
>    to discuss specific technical issues that would be easier to resolve
>    in person than over e-mail.  The program committee will also consider
>    "information sharing" topics if they are clearly of interest to the
>    wider development community (i.e., advanced training in topics that
>    would be useful to kernel developers).
>=20
>    To suggest a topic for the Kernel Summit, please do two things. by
>    September 10th, 2025. First, please send e-mail with a subject prefix =
of
>    [TECH TOPIC] to ksummit@lists.linux.dev.  As before, please use a sepa=
rate
>    e-mail for each topic.
>=20
>    Secondly, please create a topic at the Linux Plumbers Conference
>    proposal submission site and target it to the Kernel Summit track:
>=20
>        https://lpc.events/event/19/abstracts
>=20
>    Please do both steps.  I'll try to notice if someone forgets one or
>    the other, but your chances of making sure your proposal gets the
>    necessary attention and consideration are maximized by submitting both
>    to the mailing list and the web site.
>=20
>=20
> The CfP is closing this Wednesday, so please submit it soon.

Yes, I already submitted the CfP on https://lpc.events/event/19/abstracts a=
nd got the confirmation email.

Also I resend another proposal email subjected with  [TECH TOPIC]  and almo=
st identical message body.

Thanks for the hint!

Coly Li

