Return-Path: <ksummit+bounces-949-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A599A744FD5
	for <lists@lfdr.de>; Sun,  2 Jul 2023 20:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 548661C208D3
	for <lists@lfdr.de>; Sun,  2 Jul 2023 18:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACCD3D70;
	Sun,  2 Jul 2023 18:44:59 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3BC28EE
	for <ksummit@lists.linux.dev>; Sun,  2 Jul 2023 18:44:57 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51d80d81d6eso4322958a12.1
        for <ksummit@lists.linux.dev>; Sun, 02 Jul 2023 11:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688323495; x=1690915495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NWpGd6HpUhZvtcMDzu6WNa28oW2pb7Mq8EAmjspSp+w=;
        b=G/Z3QQ3vXRZ1DJDjskslWIUlbf5dnZvfmhincYwyf6AM57cRjaVKxMcgHWtxcbn0Wo
         pNtQq0QgC/mBW1/8GQ+w/haAIv7z4hmNxb+7BxLD8wLlJMKrmxQZPfuFR6FUSWnJDnK8
         02wOKtd+ZzvI8bafUoHycKFpxDHmkbL1OmCQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688323495; x=1690915495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWpGd6HpUhZvtcMDzu6WNa28oW2pb7Mq8EAmjspSp+w=;
        b=GLf/q2o+wplxBYLZ4SXy6AvfeF9tTeVt54DGblqNeZZRiE6kZZLgL6dmQKQhUcCJkX
         R3pZHHu9ZBR9xnnD7nTD8Rn/+9xwscjj8StFs9yPKQ0W8RXY9+WouWU4WCV/3UZHzZKs
         jb03xR/UAYUptgwKV72/qUYWlNwljlDYnXTTjuvyBimTFa68ZLH5TilyCv0NFyBJm7JD
         zbJaiuSpgUj8sINJu/6S7DUsBPl9Z0a/6t3+vywjgNVEILad27uuPPByynVaByp7gsKw
         tc+9IYyERMV4aNfPCYfaEJl/M3wOZDu+mWq5QyezTmwbbo70FflxCvWiEdzQhY2ll+3m
         o01Q==
X-Gm-Message-State: ABy/qLbuIXSCxLu0rL54J+YSHfngDkFevWsQOhfGy3+89mGhfCmoSrFn
	bfBvczmTaXoAQtBQ1U55hNzATrqShgrG8KIKrEBmMq4F
X-Google-Smtp-Source: APBJJlGThVYoQXfjtrz8vH66J80aqbQA0SGeDu4b8eWTBSFGHNgRKDtvk3d2dkE99OXom/7IK9eqVQ==
X-Received: by 2002:aa7:c60c:0:b0:514:9df0:e3f3 with SMTP id h12-20020aa7c60c000000b005149df0e3f3mr6599321edq.0.1688323495456;
        Sun, 02 Jul 2023 11:44:55 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id w1-20020a50fa81000000b0051df67eaf62sm2932205edr.42.2023.07.02.11.44.54
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 11:44:54 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51d80d81d6eso4322941a12.1
        for <ksummit@lists.linux.dev>; Sun, 02 Jul 2023 11:44:54 -0700 (PDT)
X-Received: by 2002:a50:ed02:0:b0:51d:f7dc:8019 with SMTP id
 j2-20020a50ed02000000b0051df7dc8019mr4214139eds.6.1688323494340; Sun, 02 Jul
 2023 11:44:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87fs6rxppz.fsf@meer.lwn.net> <871qi6glzl.fsf@intel.com>
 <87y1k2kl5a.fsf@meer.lwn.net> <20230701214603.6d0b299b@rorschach.local.home>
 <CAHk-=wgSEi_ZrHdqr=20xv+d6dr5G895CbOAi8ok+7-CQUN=fQ@mail.gmail.com> <20230702143237.000a3330@gandalf.local.home>
In-Reply-To: <20230702143237.000a3330@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 2 Jul 2023 11:44:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh+BDKMvm97wuqP6_09=oBrEGFkf=Cd_3+W66RvtWM1Tw@mail.gmail.com>
Message-ID: <CAHk-=wh+BDKMvm97wuqP6_09=oBrEGFkf=Cd_3+W66RvtWM1Tw@mail.gmail.com>
Subject: Re: Intersphinx ([TECH TOPIC] Kernel documentation)
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Jul 2023 at 11:32, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Interesting. For the tracing user space code, I had to start committing the
> C file output for flex/bison because people were complaining that their
> versions of flex and bison wouldn't make working C files.

You are presumably the only person who changes the lexer. So you find
it easy to serialize.

In the kernel, we've always found it much more painful with shipped
files. We still do it, but only for some very very special stuff.

For example, we have this "mkutf8data" program.  It can generate our
utf8data.c file. Allegedly. Nobody ever does. You need the character
database files to do it.

For something like flex and bison? Just write better code.

             Linus

