Return-Path: <ksummit+bounces-658-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE565506B9
	for <lists@lfdr.de>; Sat, 18 Jun 2022 22:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 5893C2E0A10
	for <lists@lfdr.de>; Sat, 18 Jun 2022 20:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A8633FB;
	Sat, 18 Jun 2022 20:50:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB8F7B
	for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 20:50:07 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id i16so7682146ioa.6
        for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 13:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tIVdK19t4eJQh7CQN2pc8WigupI3MA12KWuy+DN1SRc=;
        b=KBi2zwtyOD3vONe63EF6Jlq+EjHvA9YEIkaIE4pHLbF5lrPZRgMm8YlZbV1wYRpSLs
         WUtnzpI85xDCQ2LR15kJO2jrsWaH/1q6Sa6d4W+Tt139smOmNNj9XM0ZwGPZcITKaCJP
         NhJ9sB+B6PGipTcPNshWWq/z/T3ePYGhdS72Hxh2bCBWzu17BWHGBY7prp9ZIgSE4aX3
         6CzojZzNJafjtXUjIk5WwgasfwSR7tJHpUs0D3vLbsWJhmnceV98ZC1fEINL9OlcA9vw
         FNeNiY3vRilVTH8GemP1u6im4KgUi5ZP9Dj/HcQQBr72OeZYROkEH/9KALUTxYCFGLm7
         SqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tIVdK19t4eJQh7CQN2pc8WigupI3MA12KWuy+DN1SRc=;
        b=YQEdyY+HS4BU6vdKpxBTWP4gGp8i7uXyftUuCYZiVat7wsY+0F/C6oUtQ35ShCGEP3
         4MmbhsN3VQ/IzG3Cw+oXI5gFKzuf9tKUQLXp0HScq1tvD2WjrSw1aFVFJTvmIfuvLG42
         KYcscHQOFBowfXut5ettAGZtsofQBpmZjTKv05jT7s1xsuOGD6t4mzTVu1AgbYo2WqE+
         yu+sHALS3wn5I9uk9tt5J+Cgn/qYJna2wq/Z16F+ZC7rQlemEKGhc7GFPhOQ1chMvfqJ
         oP9qkDeew3cUaQaQD8hBdkJFHJ6mOo66WXlBxj2znd8jrXLFc5ZFOh8zeDlJe9D1GWkZ
         3sew==
X-Gm-Message-State: AJIora9OQpqNUW+M8t4N6kxMKfhtEownDQVDlvwEfQ53fTnOSv7WV3Vv
	zsHVUMXudOZcc7qLtgIdul2DXhFrMGBWiiIp8gvSzBJS
X-Google-Smtp-Source: AGRyM1uoicwIA0LT3O3Jy3uVR7O70hqWHFB3HzJrHFXNstbsnDC9GvmWPhcdGl+yaPRAKOZCAfBALAcYLUQ9tfhe/Lo=
X-Received: by 2002:a6b:2a42:0:b0:66a:3a6f:9c29 with SMTP id
 q63-20020a6b2a42000000b0066a3a6f9c29mr7994396ioq.177.1655585406200; Sat, 18
 Jun 2022 13:50:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
In-Reply-To: <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Jun 2022 22:49:55 +0200
Message-ID: <CANiq72mBWUidZwM1da2a-+30r0i0JmEX8eupXp2Hs7npi4zytg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 18, 2022 at 10:42 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> All previous topics but this one are technical. To restore the balance a
> bit (and also because I believe it's important to the success of this
> project :-)), I'd like to also discuss the impact on the kernel
> maintenance at large, beyond just the maintainers who opt in to be early
> adopters of rust in their subsystem.

Definitely, I think it is a fair topic (there was some discussion on
this last year, but it may be good to revisit it).

Cheers,
Miguel

