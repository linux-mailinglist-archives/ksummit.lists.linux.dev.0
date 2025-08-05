Return-Path: <ksummit+bounces-2053-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE8B1B989
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72F8F7A7AC4
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8D022CBD3;
	Tue,  5 Aug 2025 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/B4S5v8"
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EF121ABD0
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 17:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754415630; cv=none; b=pxqTKg5cfPHg1L5sageXM2BaXYDkL086XA/2ajlNYc4XQlw4rE1EoxLs3uuD5xTcVhnn8nSxOeSAZnIsO0A8sXDZehmglRJ3fnnUV0X5+NiVDmn215vlSnGPh2vJk9kzxjjMSlbDHL4uD9rrJKnpJgHgHz6LO/VeLMLCtBEbJZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754415630; c=relaxed/simple;
	bh=rKVxHN5jiMIvqkNJpZHqk09aguXhGXIYEmAtvDHpYcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTwbPkP74lAfJ2qVXeJSZf2NxsLbG63/OJObqtd6dqA64WeQgIpMogXGF/a7qqKjgzWt4+vnUFlx32C7X55PokMtP8S/LlO1UYt4SuEGAXQgEHU2zYfGzpAe0ocEjJLcAkniyqhVTgGthfZzXRblWeaEQaXtN1YcO827jXZni4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/B4S5v8; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-879c737bcebso4565039f.0
        for <ksummit@lists.linux.dev>; Tue, 05 Aug 2025 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754415628; x=1755020428; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKVxHN5jiMIvqkNJpZHqk09aguXhGXIYEmAtvDHpYcY=;
        b=c/B4S5v8lin19Srs6DLlaoHnsYzHQe/c11//yF0UskxSV29quMkX7wQ/qpWB3xiCAe
         hrJW0dhHIlpmWf1EX1rpnv2NDUWzl/YUyYJ4F6FsvT7nfs89ooGBTWE8HM3KS+WOfuUS
         wLFXXMSU+FuSWEu6G7jum1WF+84AK9V3V/2YweEvwO3S0vZ2x5AgHK1NqnDXhnGS9a6g
         5jD+FfnACXcqa0zcQcZqCLhNoVr7vkU1c76keSo3tvGunOEezIJCnCxkugdnQuhD8SES
         MRruw0xGJ+LVDggG4iHZdDYL6dvQUlEt4/Req33MzB3XDiMu34lyjP7vmIvfA0ey2G0u
         IA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754415628; x=1755020428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKVxHN5jiMIvqkNJpZHqk09aguXhGXIYEmAtvDHpYcY=;
        b=EwJbAZjXirbyQEI3yIjPjQDwSFet6iB+eriI6kiBOGAbg74OjK8NywleIuILu5lkru
         EfSOFxOKMIW22kZkAjvf62gCWXlehd7WRD6wbSyUGRwpYhkfJJaKOlFxT+Eu1XXBy8Hu
         QHTmwlB7zACCN1GPr7M9umr5wGlGydWV4g+O2DwvFNdFq8RD0Lm23lnc+KUT5LNxKPqZ
         tEL9F7o9O0ejJFs4KoQcsovjJpcv9Elggcodz3U2Jb84pNOoVaHQIcMtgjR60lJ6LJAY
         zms9bGokEsRuFtEQz0dBHBJ3Bkuoi621vyl2CNkMqndsItmNA46FOodz21vXB8Rz8gD+
         X5bw==
X-Forwarded-Encrypted: i=1; AJvYcCUu2alV/knPaoq1L1RQWJyTkIAjKMd4Wxt733pZeGdqcVZnXuwSphYiZ2DBObGMoAlnPZBs3Zj+@lists.linux.dev
X-Gm-Message-State: AOJu0Yzis/HJC5oxTmpV72JyZ7McKGzCW9KdlNnu+cWx5vHqkkJ4a0or
	Nvq4SKm2i4SYTn0sCqUINWKHKZR5VtQJfxPS5AX0r44mgnclIm2+T3Qj3lgiMYhjgcHsPj/zFzN
	56eYr55OQfQPS2qjx5OnviKD5DIBByA4=
X-Gm-Gg: ASbGncvmUZO3iCmt2wWshLD2vCMCaE5PuHCr/9THJ7TBEKJH1RaIg+IY3HGMEsNS+lO
	KVFAWTOL9SL05WDQe+dBNL15v0sKnYkf3IqxNMbIBETaii3AHRwbNAOsmfXKUcr00CRYyFjVNsM
	u6pjM8PhF2OYLwgT6Q/V8nxnXg1+XGI8LiwyW6rmZGtr+KotGKaY8ZeODgXaX2jkK0RCyEoMvxc
	U4GgdoItb+pCFCvtIypXtKDltlv98xzC8vNhPIa
X-Google-Smtp-Source: AGHT+IGTetiahquQGxnS9ACAovrJuCYOHaU+2NKyOGKyTuKqS1FtWwc94mcZRls1gdJfZfzPV377U3v8myopV2WpLd8=
X-Received: by 2002:a05:6602:1548:b0:881:8bc8:b02f with SMTP id
 ca18e2360f4ac-88191aeea3cmr960061539f.2.1754415627691; Tue, 05 Aug 2025
 10:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk> <20250805122828.68312a8d@gandalf.local.home>
In-Reply-To: <20250805122828.68312a8d@gandalf.local.home>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Tue, 5 Aug 2025 17:40:10 +0000
X-Gm-Features: Ac12FXwk6JymuP3Jqh25GXQkS-0lbv-t8M3R6I4nnFka5YPlIQAMge7XjTWvbzQ
Message-ID: <CAB=6tBRUuSBo6xocUJh5oaPsiPPsg6EBjPMpyu0HxkFcs3BOpg@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>, Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev, 
	Kate Stewart <kstewart@linuxfoundation.org>, Gabriele Paoloni <gpaoloni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 4:28=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
>
> I like to see what is happening but I just don't have the time to review
> them. But every so often, one catches my attention where I think a patch
> shouldn't be added. But that's very few and far between

OBRequirementsPlug: Documenting low level design expectations
[1][2][3] should provide a
foundation for semantic filtering. It is one thing to be faced with a
"big wall of patch" that looks
like a "big pile of work". It is a completely different game when you
can readily identify what
parts of the design that patch affects.

There is no panacea, but a stepwise improvement is definitely within reach.

..Ch:W..

[1] https://sched.co/1zfhU
[2] https://www.youtube.com/watch?v=3D_N3l_EEV8uM
[3] https://lpc.events/event/18/contributions/1894/

