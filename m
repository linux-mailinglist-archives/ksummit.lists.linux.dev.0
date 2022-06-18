Return-Path: <ksummit+bounces-653-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADCA550583
	for <lists@lfdr.de>; Sat, 18 Jun 2022 16:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79805280A98
	for <lists@lfdr.de>; Sat, 18 Jun 2022 14:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962E52F5C;
	Sat, 18 Jun 2022 14:38:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541FB7B
	for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 14:38:03 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id d6so4732874ilm.4
        for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NgkEACYdc6JMdLhL/V0++bpDN8//SMbyDWqxBc4U+nY=;
        b=T1QjmjAN7AHeYCbRHYAJt3CAyRGJv8O5HHUBX4ROvWjhaD3JlX2zs0Yvvlgb+SIV1x
         dWApH3mcT3uV8XDmwPSjzKFZ6UDA4OVsDIeo9u6L7RdPMo/b0VwbLHXr7zM5rkP/L5+A
         9wndMm4GufnS4Rhxd2h2oj7M1jSq6s9h/kAtkQJR8bqPAZfnU1EJH13hEap9TTK6c+4m
         spRP7EjJwZd4bl51fp4DX2+VudauE8XeN3fRY0BWgnkz2uPouYpfoTkqvzFKXdGgbKVJ
         DMBbWviCONpjgBZHr3BwJHjoOIwLmm3D2M/whnTsolVcfaDY4nHSWkHNjnlhYyZBRGQI
         qGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NgkEACYdc6JMdLhL/V0++bpDN8//SMbyDWqxBc4U+nY=;
        b=t8vNRhtVjXj7jCJ3tBSfHAEN5L6hdn7P56Sct31drp7UWdwdWxeV8P1xmDtR1Xk0SO
         X4K0L+UGjgYoG+bRlOJ6O+ogMHTB8Y2Rcaikmo51eGdAHK4p+OI6k074CYRBMBBlsyk2
         JpiAyNAH2JSLz/4KVKOOcoK0lY7ZdkZ98ZwEHFfz6ioWDXByN4ZTlQCibNXSbLI7pXa+
         lAFDUFoKesVPwa2TzC+rPGsrbAKf5JyFwhXLFQ4FXFC8OkC3ZB817NmivsWha9584P+j
         VNsLkogDbddlGYFcwKAiJrQNiRIwmFhUnLAJhIhG08RD0uO2yMyBjFGsMcN+6smiX79U
         n19w==
X-Gm-Message-State: AJIora+dUs/0psheeiFiKgxN6BJHEogZN9wxQ4HjBltg9rH+WVNHHaQP
	J/b7mKWbgADuTlsBN8ex0/uK3X+V5XxK+ixOGp4=
X-Google-Smtp-Source: AGRyM1tjtm7tKbRcCSMwz51Sq2SKDMvRRdSkP5FO1mfo3RuBXHSuXT3YNxGwpG2ePO3l+j0lcrhc5ZG4uh8FFPQkqiA=
X-Received: by 2002:a05:6e02:1525:b0:2d3:f72e:eadf with SMTP id
 i5-20020a056e02152500b002d3f72eeadfmr8533320ilu.5.1655563082390; Sat, 18 Jun
 2022 07:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87sfo3nh3t.fsf@meer.lwn.net> <20220618092447.5ebed314@sal.lan>
 <CANiq72kafybxPbS13g+heYMX=Ggmw_8MqYj41uJ0Ek=3HP7-eA@mail.gmail.com> <20220618121606.755e40df@sal.lan>
In-Reply-To: <20220618121606.755e40df@sal.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Jun 2022 16:37:51 +0200
Message-ID: <CANiq72kb1CXeB4C4Z9UKyPiu8y4c62apVUMTJ5hKtYCvg9M1ig@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit <ksummit-discuss@lists.linuxfoundation.org>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 18, 2022 at 1:16 PM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> I meant that rustdoc could generate ReST output, being included inside
> the Kernel documentation on a way similar to kerneldoc. This would
> integrate better with our building system, which can produce output docs
> on 3 different formats (html, epub and pdf).

That may lose some of the advantages of the rustdoc output (tailored
to Rust code, navigable source code view, etc.).

It may be possible to encode a lot of the information in ReST and then
replicate functionality with Sphinx/plugins, possibly having a Rust
domain etc., but I am not sure it would be worth it (for the HTML
output at least).

Cheers,
Miguel

