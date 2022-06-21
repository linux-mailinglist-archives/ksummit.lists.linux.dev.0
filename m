Return-Path: <ksummit+bounces-679-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 288E35537D6
	for <lists@lfdr.de>; Tue, 21 Jun 2022 18:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id C73462E0A45
	for <lists@lfdr.de>; Tue, 21 Jun 2022 16:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827B43D8B;
	Tue, 21 Jun 2022 16:33:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4561397
	for <ksummit@lists.linux.dev>; Tue, 21 Jun 2022 16:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655829200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f4OLfshBRWmwKPI927vgIV02KzcGCXoQq0E0W0vpN0g=;
	b=KfBnt+gSVYhARmwlh7N6TP/2hPyJMJpu5ME9MuSjJoal3I4+RT9p4NXFb3Ma3DWDANbNOu
	zEt63AtMNCKT9RjfuLMuKAJ5as5Il10IZxNMCylQocV+gqVuK8U6GBuwdUxAQosebvxxV0
	glBsicce2euh8Z98oHiLrQsqDOrVypQ=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-B7P6PthqMh-9USBRcZlmeg-1; Tue, 21 Jun 2022 12:33:19 -0400
X-MC-Unique: B7P6PthqMh-9USBRcZlmeg-1
Received: by mail-pg1-f200.google.com with SMTP id a185-20020a6390c2000000b0040cb1cddf13so3375603pge.19
        for <ksummit@lists.linux.dev>; Tue, 21 Jun 2022 09:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f4OLfshBRWmwKPI927vgIV02KzcGCXoQq0E0W0vpN0g=;
        b=aDcSSK1FxHbpEoPzv+kALCbjBAyPY78EpMFY0Wbp7B3KiAqKuRUi0MuAJy4gmW2YTx
         7Ygb68SmxCrRQPu67dlQ+Gt0XZiDz4dM+k7MYZI3Il6bBnRgF1C9+d1xZwCvYymjSjot
         rjsArogbRDbHBUWK4OQXvytgbJUuTRLRi/TQwk7ik2Q1ASIGWwGSenuY0IA1wiv7Yx9D
         fAqE7uqKgIKON5EnTqFfz/c7tbu8hOc50YRjYVJ/4Q8qDNndRAqoHgYU/Lmz2XoWtc16
         CS77xZQF5YzNaug1vy876ieqq3jClreVVrY2abMUWoOWjwenpCO0o5aYxXLBAsTKsAB5
         rzHw==
X-Gm-Message-State: AJIora9EQ+GmvXibVHt8/10q9t7r/xSsbeqXFIVkHLdyrbXbxWPMZ4bb
	bLZdocIz/Ub+Cbk5qADUDygAIrwLyLKpSFR7PDPSQVw7x+15YhAsYzZdVVo4rsa8D/3xrgPn5e2
	ppeeqiYzuM1siHvzIUlyxyUOlotqlNiPguw==
X-Received: by 2002:a05:6a00:2187:b0:50c:ef4d:ef3b with SMTP id h7-20020a056a00218700b0050cef4def3bmr30574430pfi.83.1655829198026;
        Tue, 21 Jun 2022 09:33:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tJ+yrIH84hMSbppJEjB/OWIdqbB3E40dp8GZVBVLHAbIu2jN4PgkX3KDK260oFjKtNUIdQ4M69MlNJsr2rueE=
X-Received: by 2002:a05:6a00:2187:b0:50c:ef4d:ef3b with SMTP id
 h7-20020a056a00218700b0050cef4def3bmr30574400pfi.83.1655829197666; Tue, 21
 Jun 2022 09:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2206151023250.14340@cbobk.fhfr.pm>
 <20220615170407.ycbkgw5rofidkh7x@quack3.lan> <87h74lvnyf.fsf@meer.lwn.net>
 <20220615174601.GX1790663@paulmck-ThinkPad-P17-Gen-1> <nycvar.YFH.7.76.2206152022550.14340@cbobk.fhfr.pm>
 <20220616122634.6e11e58c@gandalf.local.home> <bbb46f66bb8518e90030fe97a1225adf178654d1.camel@HansenPartnership.com>
 <20220616125128.68151432@gandalf.local.home> <a522bfa4241eb263e354ebbb293b0d629dd2e026.camel@HansenPartnership.com>
 <nycvar.YFH.7.76.2206170947520.14340@cbobk.fhfr.pm> <20220617103050.2almimus5hjcifxl@quack3.lan>
 <CAO-hwJJxCteD_BHZTeqQ1f7gWOHoj+05qP8bmFsRYVfMc_3FxQ@mail.gmail.com>
 <dc6ca88d-d1ef-a1ab-dbef-e9338467271d@redhat.com> <CAO-hwJ+DJGYzKeGd8q7ma3L_qfd=phxczyfPqPnoz-DV9By_Cg@mail.gmail.com>
 <20220620091344.6c6499e4@rorschach.local.home> <20220621110514.6ef174d0@rorschach.local.home>
In-Reply-To: <20220621110514.6ef174d0@rorschach.local.home>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 21 Jun 2022 18:33:06 +0200
Message-ID: <CAO-hwJJ=9oNXA+mX9r=DwyUxbvf5-gWxAzBRCrbqdLd1LbPQdg@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [MAINTAINERS SUMMIT] How far to go with eBPF
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Hans de Goede <hdegoede@redhat.com>, ksummit@lists.linux.dev
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 5:12 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Mon, 20 Jun 2022 09:13:44 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
>
> > This statement is the issue. There's not a clear line of what
> > constitutes what eBPF is being used for, and worse, what is guaranteed
> > to work across kernel versions.
> >
> > My fear is that we will start having an expectation that pretty much
> > any eBPF program will continue to work, and there's going to be a lot
> > of disgruntled users when it doesn't.
> >
> > Having configuration uses is one thing, enabling full device
> > functionality is another. And anything that touches core interfaces
> > need to be scrutinized.
> >
> > If we look at where BPF came from (iptables et.al.) and having it do
> > nothing more that that but for other parts of the system, it may be a
> > good start. But even that could introduce dependencies of internal
> > kernel implementations that could break over time. Basically, we can
> > try to not break BPF programs but we really need the decree that it's
> > not user API, and does not follow the "don't break user space" agenda,
> > as anything that uses eBPF, is *not* user space. It's just another kind
> > of kernel module.
> >
> > And if an eBPF program does break, if the source of that program is not
> > available, then the answer to fixing it should be "tough luck". This
> > should not be a way for proprietary code to have their kernel API.
>
> I'm currently at the Open Source Summit, and Dirk basically asked my
> question almost verbatim to Linus (during the "Dirk and Linus show").

Heh, interesting :)

>
> And Linus stated that there is no defined "API". It's just "do not
> break user space tools", and this includes eBPF. That is, if something
> that is useful in user space that breaks with an upgrade, what breaks
> it either gets reverted, or a "fix" is done to make it work again.
>
> Linus specified that when it gets to eBPF programs that do debugging or
> tracing, or other really low level interactions with the kernel, then
> if it breaks a user space tool that is doing this low level work, then
> that's just part of the work flow (fix user space to match, it's
> already dependent on the kernel implementations). He specified if you
> break "real user space tools, that normal (non kernel developers) users
> use" then you need to fix it, regardless if it is using eBPF or not.

Hmm, OK, but I am not sure we are all talking about the same thing here.

For real user space applications using eBPF, AFAICT, today we have
cgroups and network filtering.
And for those 2 applications, given that there is a well defined eBPF
API, it wouldn't surprise me that maintainers should take care of the
user space breakage.

However, if I decide to attach a random BPF program to random
functions in the kernel without any involvement in the kernel, and use
it to get some metrics, how can we consider this to be plain debugging
or an actual user space application (assuming I share it with the rest
of the world)?

So IMO, we can not assume that any user space application relying on
eBPF should never break if that application is hooking to random
functions in the kernel. If that user space application is using a
well defined (not-an-)API, then yes, this is something maintainers
should be aware of.

I might not win that argument with Linus, but I still prefered your
suggestion to make eBPF for drivers similar to kernel modules.

>
> This still does not address the problem. First, where's the line where a
> tool becomes something for normal users?

I thought this was the initial topic that Jiri raised, and why we need
to have this discussion :)

>
> Next, eBPF can now attach to pretty much *any* function, and modify how
> that function operates (changing parameters, etc) Basically, eBPF can
> do live kernel patching like changes.

AFAICT, technically, when you attach an TRACING bpf program, you only
have read-only capabilities on the arguments.
To be able to change the return value, the kernel needs to explicitly
export the function as such, and to change the incoming data, well,
you need a special kfunc.


>
> If a new feature is implemented with eBPF and that eBPF feature depends
> on some internal kernel implementation, where the maintainer of that
> code is unaware of this new eBPF implemented feature, if they change
> their code and break this, then the burden is on the maintainer to fix
> that breakage, not those that implemented the eBPF feature.

I think I would need a more precise example here.
kfuncs are by explicitly defined in the kernel, meaning that the eBPF
program willing to use that feature needs to go through the kfunc. And
then, I would hope that the writer of the kfunc writes selftests for
it, and we can detect the change early enough before it gets pushed.
So the only other part a maintainer would not be aware of is if the
eBPF program attached a tracing program to one of the internal
functions, and I don't have a solution for this given that it's
already in the wild, and you already had the case once.

>
> This is the worry I have. Maintainers now have no control over what is
> exposed to users that can become 'user API", aka break normal user
> tooling, without having a clue that something now depends on the
> implementation of their code.
>
> We really need to take a step back before we let eBPF become fully
> controlling of anything in the kernel. Because that's going to add a
> huge burden on maintainers that do not even use eBPF.

We already have the painful part available to anybody.

I have a simple example for the gamepads with a touchpad:
I can easily attach a eBPF program that counts how many times a hidraw
devnode is opened, and if the result is positive, disable another
devnode through the sysfs (the input node of the touchpad) that should
not be used at the same time. If I push that code to a userspace tool,
let's say Steam or systemd, this will be considered as "application"
and I am now preventing the maintainer of hidraw or maybe devnode to
not do further changes regarding those functions?

So I would rather have a clear definition of what is an eBPF program
that is an extension of a driver, and how we can deal with internal
kernel changes.

>
> Exposing information for consumption only is one thing, and what I
> would like to have more of, but once you allow non-passive interactions
> with the tracing infrastructure, it changes things where I can see a
> lot of maintainers will have more push back against the former (reading
> only tracing, as there's no way to keep it from making changes).
>

Again, AFAICT, non-passive interaction is opt-in only. It doesn't mean
this won't have any side effect on other maintainers, but if one
maintainer wants non-passive interactions, then that maintainer
probably needs to define what is supposed to be used with (or just
embed the source in the tree and provide selftests).

Cheers,
Benjamin


