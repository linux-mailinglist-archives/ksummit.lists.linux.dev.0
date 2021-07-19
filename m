Return-Path: <ksummit+bounces-390-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id D04B93CD59A
	for <lists@lfdr.de>; Mon, 19 Jul 2021 15:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 7152E3E109E
	for <lists@lfdr.de>; Mon, 19 Jul 2021 13:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2792FB3;
	Mon, 19 Jul 2021 13:16:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AAF72
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 13:16:03 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id c12so3976953wrt.3
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 06:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JuhZ9E8nSoBuFaE0TZw821ehMLfRMQl6oRmy+M606M4=;
        b=a0/r5meh/7+gID1fng2297hACkhl9nBiTsDN/tII0koLk5B69si3Egw2hUY2hkIZ+H
         zkaI+YvR6N+GdvhBVOaJT5cOG/fdroC8KR+qOFbo15c1TDZlEh4Xk++YN59Kykke0ysd
         rmWlRyFxEqg5jFrXVdhGeJDUYI+NtkIIOy8lmUmuc3ty6tG6quyWl26cSwXlnyFNL+LU
         EAMBL+bHYNbyq92lw3v5zDzrjlmq8DwcmcQfueKcGfrRiQeMrnPn5fhQfZ7N4tDpchm3
         LTDXUwHTGr6+nNwK06Zko3xaJ7tETqwmpIuOZRrUvFzm3BvVl5UazN+wcoPq1H2PyL6i
         eKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JuhZ9E8nSoBuFaE0TZw821ehMLfRMQl6oRmy+M606M4=;
        b=R+VtxuTQP4Oa9qSqcsx1g4xl5yUTbM/pwx54SH4MdnxOfVUadxgEK0O7LXPBbFS2dO
         JJwizvYCoDYm2x8hdnxtzHPe5ySdIY1Mb8+e1a7suLseC2EgRyuAU29hqdkYIfRmNVuA
         6gnay5FnenSyIcboVerQ1sCA2I/NiirasKTe4u3w0+YU32i9WgPYnnxuh7Ybo5bMmurI
         ge3PnLRrOlbAYpwm3Y0ISbne6Vg6KB6IGCzBVBouZWofVx4Mil6HCoA6gUZYyBO+vnyg
         w+9chNg+LUCOpQCYnefxomKZu5wVJTar3DZ8g+9sBBBqy5EjyyuuRzrOXY6RJVJJEthP
         qGLA==
X-Gm-Message-State: AOAM5329gRLmPoJUADiD4hJojF6Ok3fg1+WYSlXY+hfoUNaLWqUNdU7o
	IoaET6brX5wmDEnARPOWHUUQ
X-Google-Smtp-Source: ABdhPJyF9cpWt6NsR7EGQD215yE7Ln4CGZwyRvXF8zm+Xv4lqY1R48zJCj785e43IN8xsEyo1NbFyg==
X-Received: by 2002:a5d:6281:: with SMTP id k1mr29262259wru.369.1626700562261;
        Mon, 19 Jul 2021 06:16:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:7317:9289:34f3:7374])
        by smtp.gmail.com with ESMTPSA id e15sm19899073wrp.29.2021.07.19.06.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 06:16:01 -0700 (PDT)
Date: Mon, 19 Jul 2021 14:15:57 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YPV7DTFBRN4UFMH1@google.com>
References: <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="08cM4rd2G1eCnIF2"
Content-Disposition: inline
In-Reply-To: <YPVvEZgcP1LMGjcy@google.com>


--08cM4rd2G1eCnIF2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2021 at 01:24:49PM +0100, Wedson Almeida Filho wrote:
> On Fri, Jul 09, 2021 at 12:13:25AM +0200, Linus Walleij wrote:
> > I have seen that QEMU has a piece of code for the Arm PrimeCell
> > PL061 GPIO block which corresponds to drivers/gpio/gpio-pl061.c
> > Note that this hardware apart from being used in all Arm reference
> > designs is used on ARMv4T systems that are not supported by
> > LLVM but only GCC, which might complicate things.
> 
> Here is a working PL061 driver in Rust (converted form the C one):
> https://raw.githubusercontent.com/wedsonaf/linux/pl061/drivers/gpio/gpio_pl061_rust.rs

I'm also attaching an html rending of the C and Rust versions side by side where
I try to line the definitions up to make it easier to contrast the two
implementations.

--08cM4rd2G1eCnIF2
Content-Type: text/html; charset=us-ascii
Content-Disposition: attachment; filename="pl061.html"

<html>

<body style="margin:0;padding:0;color:#333;">

<div type="width: 100%; margin:0">


<!-- HTML generated using hilite.me --><div style="background: #000000; overflow:auto;float:left;width:50%;box-sizing:border-box;"><table><tr><td><pre style="margin: 0; line-height: 125%">  1
  2
  3
  4
  5
  6
  7
  8
  9
 10
 11
 12
 13
 14
 15
 16
 17
 18
 19
 20
 21
 22
 23
 24
 25
 26
 27
 28
 29
 30
 31
 32
 33
 34
 35
 36
 37
 38
 39
 40
 41
 42
 43
 44
 45
 46
 47
 48
 49
 50
 51
 52
 53
 54
 55
 56
 57
 58
 59
 60
 61
 62








 63
 64
 65
 66
 67
 68
 69
 70
 71
 72
 73
 74
 75
 76
 77
 78
 79
 80
 81
 82
 83
 84
 85
 86
 87
 88
 89
 90
 91
 92
 93
 94
 95
 96
 97
 98
 99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206
207
208
209
210
211
212
213
214
215
216
217
218
219
220
221
222
223
224
225
226
227
228
229
230
231
232
233
234
235
236
237
238
239
240
241
242
243
244
245
246
247
248
249
250
251
252
253
254
255
256
257
258
259
260
261
262
263
264
265
266
267
268
269
270
271
272
273
274
275
276
277
278
279
280
281
282
283
284
285






286
287
288
289
290
291
292
293
294
295
296
297
298
299
300
301
302
303
304
305
306
307
308
309
310
311
312
313
314
315
316
317
318
319
320
321
322
323
324
325
326
327
328
329
330
331
332
333
334
335
336
337
338
339
340
341
342
343
344
345
346
347
348
349
350
351
352
353
354
355
356
357
358
359
360
361
362
363
364
365
366
367
368
369
370
371
372
373
374
375
376
377
378
379
380
381
382
383
384
385
386
387
388
389
390
391
392
393
394
395
396
397
398
399
400
401
402
403
404
405
406
407
408
409
410
411
412
413
414
415
416
417
418
419
420
421
422
423
424
425
426</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #000080">// SPDX-License-Identifier: GPL-2.0-only</span>
<span style="color: #000080">/*</span>
<span style="color: #000080"> * Copyright (C) 2008, 2009 Provigent Ltd.</span>
<span style="color: #000080"> *</span>
<span style="color: #000080"> * Author: Baruch Siach &lt;baruch@tkos.co.il&gt;</span>
<span style="color: #000080"> *</span>
<span style="color: #000080"> * Driver for the ARM PrimeCell(tm) General Purpose Input/Output (PL061)</span>
<span style="color: #000080"> *</span>
<span style="color: #000080"> * Data sheet: ARM DDI 0190B, September 2000</span>
<span style="color: #000080"> */</span>
<span style="color: #000080">#include &lt;linux/spinlock.h&gt;</span>
<span style="color: #000080">#include &lt;linux/errno.h&gt;</span>
<span style="color: #000080">#include &lt;linux/init.h&gt;</span>
<span style="color: #000080">#include &lt;linux/io.h&gt;</span>
<span style="color: #000080">#include &lt;linux/ioport.h&gt;</span>
<span style="color: #000080">#include &lt;linux/interrupt.h&gt;</span>
<span style="color: #000080">#include &lt;linux/irq.h&gt;</span>
<span style="color: #000080">#include &lt;linux/irqchip/chained_irq.h&gt;</span>
<span style="color: #000080">#include &lt;linux/module.h&gt;</span>
<span style="color: #000080">#include &lt;linux/bitops.h&gt;</span>
<span style="color: #000080">#include &lt;linux/gpio/driver.h&gt;</span>
<span style="color: #000080">#include &lt;linux/device.h&gt;</span>
<span style="color: #000080">#include &lt;linux/amba/bus.h&gt;</span>
<span style="color: #000080">#include &lt;linux/slab.h&gt;</span>
<span style="color: #000080">#include &lt;linux/pinctrl/consumer.h&gt;</span>
<span style="color: #000080">#include &lt;linux/pm.h&gt;</span>

<span style="color: #000080">#define GPIODIR 0x400</span>
<span style="color: #000080">#define GPIOIS  0x404</span>
<span style="color: #000080">#define GPIOIBE 0x408</span>
<span style="color: #000080">#define GPIOIEV 0x40C</span>
<span style="color: #000080">#define GPIOIE  0x410</span>
<span style="color: #000080">#define GPIORIS 0x414</span>
<span style="color: #000080">#define GPIOMIS 0x418</span>
<span style="color: #000080">#define GPIOIC  0x41C</span>

<span style="color: #000080">#define PL061_GPIO_NR	8</span>

<span style="color: #000080">#ifdef CONFIG_PM</span>
<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061_context_save_regs</span> <span style="color: #cccccc">{</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">gpio_data;</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">gpio_dir;</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">gpio_is;</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">gpio_ibe;</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">gpio_iev;</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">gpio_ie;</span>
<span style="color: #cccccc">};</span>
<span style="color: #000080">#endif</span>

<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #cccccc">{</span>
	<span style="color: #00cd00">raw_spinlock_t</span>		<span style="color: #cccccc">lock;</span>

	<span style="color: #00cd00">void</span> <span style="color: #cccccc">__iomem</span>		<span style="color: #3399cc">*</span><span style="color: #cccccc">base;</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_chip</span>	<span style="color: #cccccc">gc;</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">irq_chip</span>		<span style="color: #cccccc">irq_chip;</span>
	<span style="color: #00cd00">int</span>			<span style="color: #cccccc">parent_irq;</span>

<span style="color: #000080">#ifdef CONFIG_PM</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061_context_save_regs</span> <span style="color: #cccccc">csave_regs;</span>
<span style="color: #000080">#endif</span>
<span style="color: #cccccc">};</span>









<span style="color: #cdcd00">static</span> <span style="color: #00cd00">int</span> <span style="color: #cccccc">pl061_get_direction(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">gc,</span> <span style="color: #00cd00">unsigned</span> <span style="color: #cccccc">offset)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_get_data(gc);</span>

	<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIODIR)</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">BIT(offset))</span>
		<span style="color: #cdcd00">return</span> <span style="color: #cccccc">GPIO_LINE_DIRECTION_OUT;</span>

	<span style="color: #cdcd00">return</span> <span style="color: #cccccc">GPIO_LINE_DIRECTION_IN;</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">static</span> <span style="color: #00cd00">int</span> <span style="color: #cccccc">pl061_direction_input(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">gc,</span> <span style="color: #00cd00">unsigned</span> <span style="color: #cccccc">offset)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_get_data(gc);</span>
	<span style="color: #00cd00">unsigned</span> <span style="color: #00cd00">long</span> <span style="color: #cccccc">flags;</span>
	<span style="color: #00cd00">unsigned</span> <span style="color: #00cd00">char</span> <span style="color: #cccccc">gpiodir;</span>

	<span style="color: #cccccc">raw_spin_lock_irqsave(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock,</span> <span style="color: #cccccc">flags);</span>
	<span style="color: #cccccc">gpiodir</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIODIR);</span>
	<span style="color: #cccccc">gpiodir</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">~</span><span style="color: #cccccc">(BIT(offset));</span>
	<span style="color: #cccccc">writeb(gpiodir,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIODIR);</span>
	<span style="color: #cccccc">raw_spin_unlock_irqrestore(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock,</span> <span style="color: #cccccc">flags);</span>

	<span style="color: #cdcd00">return</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">static</span> <span style="color: #00cd00">int</span> <span style="color: #cccccc">pl061_direction_output(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">gc,</span> <span style="color: #00cd00">unsigned</span> <span style="color: #cccccc">offset,</span>
		<span style="color: #00cd00">int</span> <span style="color: #cccccc">value)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_get_data(gc);</span>
	<span style="color: #00cd00">unsigned</span> <span style="color: #00cd00">long</span> <span style="color: #cccccc">flags;</span>
	<span style="color: #00cd00">unsigned</span> <span style="color: #00cd00">char</span> <span style="color: #cccccc">gpiodir;</span>

	<span style="color: #cccccc">raw_spin_lock_irqsave(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock,</span> <span style="color: #cccccc">flags);</span>
	<span style="color: #cccccc">writeb(</span><span style="color: #3399cc">!!</span><span style="color: #cccccc">value</span> <span style="color: #3399cc">&lt;&lt;</span> <span style="color: #cccccc">offset,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">(BIT(offset</span> <span style="color: #3399cc">+</span> <span style="color: #cd00cd">2</span><span style="color: #cccccc">)));</span>
	<span style="color: #cccccc">gpiodir</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIODIR);</span>
	<span style="color: #cccccc">gpiodir</span> <span style="color: #3399cc">|=</span> <span style="color: #cccccc">BIT(offset);</span>
	<span style="color: #cccccc">writeb(gpiodir,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIODIR);</span>

	<span style="color: #000080">/*</span>
<span style="color: #000080">	 * gpio value is set again, because pl061 doesn&#39;t allow to set value of</span>
<span style="color: #000080">	 * a gpio pin before configuring it in OUT mode.</span>
<span style="color: #000080">	 */</span>
	<span style="color: #cccccc">writeb(</span><span style="color: #3399cc">!!</span><span style="color: #cccccc">value</span> <span style="color: #3399cc">&lt;&lt;</span> <span style="color: #cccccc">offset,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">(BIT(offset</span> <span style="color: #3399cc">+</span> <span style="color: #cd00cd">2</span><span style="color: #cccccc">)));</span>
	<span style="color: #cccccc">raw_spin_unlock_irqrestore(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock,</span> <span style="color: #cccccc">flags);</span>

	<span style="color: #cdcd00">return</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">static</span> <span style="color: #00cd00">int</span> <span style="color: #cccccc">pl061_get_value(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">gc,</span> <span style="color: #00cd00">unsigned</span> <span style="color: #cccccc">offset)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_get_data(gc);</span>

	<span style="color: #cdcd00">return</span> <span style="color: #3399cc">!!</span><span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">(BIT(offset</span> <span style="color: #3399cc">+</span> <span style="color: #cd00cd">2</span><span style="color: #cccccc">)));</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">static</span> <span style="color: #00cd00">void</span> <span style="color: #cccccc">pl061_set_value(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">gc,</span> <span style="color: #00cd00">unsigned</span> <span style="color: #cccccc">offset,</span> <span style="color: #00cd00">int</span> <span style="color: #cccccc">value)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_get_data(gc);</span>

	<span style="color: #cccccc">writeb(</span><span style="color: #3399cc">!!</span><span style="color: #cccccc">value</span> <span style="color: #3399cc">&lt;&lt;</span> <span style="color: #cccccc">offset,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">(BIT(offset</span> <span style="color: #3399cc">+</span> <span style="color: #cd00cd">2</span><span style="color: #cccccc">)));</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">static</span> <span style="color: #00cd00">void</span> <span style="color: #cccccc">pl061_irq_handler(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">irq_desc</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">desc)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #00cd00">unsigned</span> <span style="color: #00cd00">long</span> <span style="color: #cccccc">pending;</span>
	<span style="color: #00cd00">int</span> <span style="color: #cccccc">offset;</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">gc</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">irq_desc_get_handler_data(desc);</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_get_data(gc);</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">irq_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">irqchip</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">irq_desc_get_chip(desc);</span>

	<span style="color: #cccccc">chained_irq_enter(irqchip,</span> <span style="color: #cccccc">desc);</span>

	<span style="color: #cccccc">pending</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOMIS);</span>
	<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(pending)</span> <span style="color: #cccccc">{</span>
		<span style="color: #cccccc">for_each_set_bit(offset,</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pending,</span> <span style="color: #cccccc">PL061_GPIO_NR)</span>
			<span style="color: #cccccc">generic_handle_irq(irq_find_mapping(gc</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">irq.domain,</span>
							    <span style="color: #cccccc">offset));</span>
	<span style="color: #cccccc">}</span>

	<span style="color: #cccccc">chained_irq_exit(irqchip,</span> <span style="color: #cccccc">desc);</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">static</span> <span style="color: #00cd00">int</span> <span style="color: #cccccc">pl061_irq_type(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">irq_data</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">d,</span> <span style="color: #00cd00">unsigned</span> <span style="color: #cccccc">trigger)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">gc</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">irq_data_get_irq_chip_data(d);</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_get_data(gc);</span>
	<span style="color: #00cd00">int</span> <span style="color: #cccccc">offset</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">irqd_to_hwirq(d);</span>
	<span style="color: #00cd00">unsigned</span> <span style="color: #00cd00">long</span> <span style="color: #cccccc">flags;</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">gpiois,</span> <span style="color: #cccccc">gpioibe,</span> <span style="color: #cccccc">gpioiev;</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">bit</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">BIT(offset);</span>

	<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(offset</span> <span style="color: #3399cc">&lt;</span> <span style="color: #cd00cd">0</span> <span style="color: #3399cc">||</span> <span style="color: #cccccc">offset</span> <span style="color: #3399cc">&gt;=</span> <span style="color: #cccccc">PL061_GPIO_NR)</span>
		<span style="color: #cdcd00">return</span> <span style="color: #3399cc">-</span><span style="color: #cccccc">EINVAL;</span>

	<span style="color: #cdcd00">if</span> <span style="color: #cccccc">((trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">(IRQ_TYPE_LEVEL_HIGH</span> <span style="color: #3399cc">|</span> <span style="color: #cccccc">IRQ_TYPE_LEVEL_LOW))</span> <span style="color: #3399cc">&amp;&amp;</span>
	    <span style="color: #cccccc">(trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">(IRQ_TYPE_EDGE_RISING</span> <span style="color: #3399cc">|</span> <span style="color: #cccccc">IRQ_TYPE_EDGE_FALLING)))</span>
	<span style="color: #cccccc">{</span>
		<span style="color: #cccccc">dev_err(gc</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">parent,</span>
			<span style="color: #cd0000">&quot;trying to configure line %d for both level and edge &quot;</span>
			<span style="color: #cd0000">&quot;detection, choose one!\n&quot;</span><span style="color: #cccccc">,</span>
			<span style="color: #cccccc">offset);</span>
		<span style="color: #cdcd00">return</span> <span style="color: #3399cc">-</span><span style="color: #cccccc">EINVAL;</span>
	<span style="color: #cccccc">}</span>


	<span style="color: #cccccc">raw_spin_lock_irqsave(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock,</span> <span style="color: #cccccc">flags);</span>

	<span style="color: #cccccc">gpioiev</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIEV);</span>
	<span style="color: #cccccc">gpiois</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIS);</span>
	<span style="color: #cccccc">gpioibe</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIBE);</span>

	<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">(IRQ_TYPE_LEVEL_HIGH</span> <span style="color: #3399cc">|</span> <span style="color: #cccccc">IRQ_TYPE_LEVEL_LOW))</span> <span style="color: #cccccc">{</span>
		<span style="color: #00cd00">bool</span> <span style="color: #cccccc">polarity</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">IRQ_TYPE_LEVEL_HIGH;</span>

		<span style="color: #000080">/* Disable edge detection */</span>
		<span style="color: #cccccc">gpioibe</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">~</span><span style="color: #cccccc">bit;</span>
		<span style="color: #000080">/* Enable level detection */</span>
		<span style="color: #cccccc">gpiois</span> <span style="color: #3399cc">|=</span> <span style="color: #cccccc">bit;</span>
		<span style="color: #000080">/* Select polarity */</span>
		<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(polarity)</span>
			<span style="color: #cccccc">gpioiev</span> <span style="color: #3399cc">|=</span> <span style="color: #cccccc">bit;</span>
		<span style="color: #cdcd00">else</span>
			<span style="color: #cccccc">gpioiev</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">~</span><span style="color: #cccccc">bit;</span>
		<span style="color: #cccccc">irq_set_handler_locked(d,</span> <span style="color: #cccccc">handle_level_irq);</span>
		<span style="color: #cccccc">dev_dbg(gc</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">parent,</span> <span style="color: #cd0000">&quot;line %d: IRQ on %s level\n&quot;</span><span style="color: #cccccc">,</span>
			<span style="color: #cccccc">offset,</span>
			<span style="color: #cccccc">polarity</span> <span style="color: #3399cc">?</span> <span style="color: #cd0000">&quot;HIGH&quot;</span> <span style="color: #3399cc">:</span> <span style="color: #cd0000">&quot;LOW&quot;</span><span style="color: #cccccc">);</span>
	<span style="color: #cccccc">}</span> <span style="color: #cdcd00">else</span> <span style="color: #cdcd00">if</span> <span style="color: #cccccc">((trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">IRQ_TYPE_EDGE_BOTH)</span> <span style="color: #3399cc">==</span> <span style="color: #cccccc">IRQ_TYPE_EDGE_BOTH)</span> <span style="color: #cccccc">{</span>
		<span style="color: #000080">/* Disable level detection */</span>
		<span style="color: #cccccc">gpiois</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">~</span><span style="color: #cccccc">bit;</span>
		<span style="color: #000080">/* Select both edges, setting this makes GPIOEV be ignored */</span>
		<span style="color: #cccccc">gpioibe</span> <span style="color: #3399cc">|=</span> <span style="color: #cccccc">bit;</span>
		<span style="color: #cccccc">irq_set_handler_locked(d,</span> <span style="color: #cccccc">handle_edge_irq);</span>
		<span style="color: #cccccc">dev_dbg(gc</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">parent,</span> <span style="color: #cd0000">&quot;line %d: IRQ on both edges\n&quot;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">offset);</span>
	<span style="color: #cccccc">}</span> <span style="color: #cdcd00">else</span> <span style="color: #cdcd00">if</span> <span style="color: #cccccc">((trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">IRQ_TYPE_EDGE_RISING)</span> <span style="color: #3399cc">||</span>
		   <span style="color: #cccccc">(trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">IRQ_TYPE_EDGE_FALLING))</span> <span style="color: #cccccc">{</span>
		<span style="color: #00cd00">bool</span> <span style="color: #cccccc">rising</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">IRQ_TYPE_EDGE_RISING;</span>

		<span style="color: #000080">/* Disable level detection */</span>
		<span style="color: #cccccc">gpiois</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">~</span><span style="color: #cccccc">bit;</span>
		<span style="color: #000080">/* Clear detection on both edges */</span>
		<span style="color: #cccccc">gpioibe</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">~</span><span style="color: #cccccc">bit;</span>
		<span style="color: #000080">/* Select edge */</span>
		<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(rising)</span>
			<span style="color: #cccccc">gpioiev</span> <span style="color: #3399cc">|=</span> <span style="color: #cccccc">bit;</span>
		<span style="color: #cdcd00">else</span>
			<span style="color: #cccccc">gpioiev</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">~</span><span style="color: #cccccc">bit;</span>
		<span style="color: #cccccc">irq_set_handler_locked(d,</span> <span style="color: #cccccc">handle_edge_irq);</span>
		<span style="color: #cccccc">dev_dbg(gc</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">parent,</span> <span style="color: #cd0000">&quot;line %d: IRQ on %s edge\n&quot;</span><span style="color: #cccccc">,</span>
			<span style="color: #cccccc">offset,</span>
			<span style="color: #cccccc">rising</span> <span style="color: #3399cc">?</span> <span style="color: #cd0000">&quot;RISING&quot;</span> <span style="color: #3399cc">:</span> <span style="color: #cd0000">&quot;FALLING&quot;</span><span style="color: #cccccc">);</span>
	<span style="color: #cccccc">}</span> <span style="color: #cdcd00">else</span> <span style="color: #cccccc">{</span>
		<span style="color: #000080">/* No trigger: disable everything */</span>
		<span style="color: #cccccc">gpiois</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">~</span><span style="color: #cccccc">bit;</span>
		<span style="color: #cccccc">gpioibe</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">~</span><span style="color: #cccccc">bit;</span>
		<span style="color: #cccccc">gpioiev</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">~</span><span style="color: #cccccc">bit;</span>
		<span style="color: #cccccc">irq_set_handler_locked(d,</span> <span style="color: #cccccc">handle_bad_irq);</span>
		<span style="color: #cccccc">dev_warn(gc</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">parent,</span> <span style="color: #cd0000">&quot;no trigger selected for line %d\n&quot;</span><span style="color: #cccccc">,</span>
			 <span style="color: #cccccc">offset);</span>
	<span style="color: #cccccc">}</span>

	<span style="color: #cccccc">writeb(gpiois,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIS);</span>
	<span style="color: #cccccc">writeb(gpioibe,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIBE);</span>
	<span style="color: #cccccc">writeb(gpioiev,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIEV);</span>

	<span style="color: #cccccc">raw_spin_unlock_irqrestore(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock,</span> <span style="color: #cccccc">flags);</span>

	<span style="color: #cdcd00">return</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">static</span> <span style="color: #00cd00">void</span> <span style="color: #cccccc">pl061_irq_mask(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">irq_data</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">d)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">gc</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">irq_data_get_irq_chip_data(d);</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_get_data(gc);</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">mask</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">BIT(irqd_to_hwirq(d)</span> <span style="color: #3399cc">%</span> <span style="color: #cccccc">PL061_GPIO_NR);</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">gpioie;</span>

	<span style="color: #cccccc">raw_spin_lock(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock);</span>
	<span style="color: #cccccc">gpioie</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIE)</span> <span style="color: #3399cc">&amp;</span> <span style="color: #3399cc">~</span><span style="color: #cccccc">mask;</span>
	<span style="color: #cccccc">writeb(gpioie,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIE);</span>
	<span style="color: #cccccc">raw_spin_unlock(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock);</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">static</span> <span style="color: #00cd00">void</span> <span style="color: #cccccc">pl061_irq_unmask(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">irq_data</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">d)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">gc</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">irq_data_get_irq_chip_data(d);</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_get_data(gc);</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">mask</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">BIT(irqd_to_hwirq(d)</span> <span style="color: #3399cc">%</span> <span style="color: #cccccc">PL061_GPIO_NR);</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">gpioie;</span>

	<span style="color: #cccccc">raw_spin_lock(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock);</span>
	<span style="color: #cccccc">gpioie</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIE)</span> <span style="color: #3399cc">|</span> <span style="color: #cccccc">mask;</span>
	<span style="color: #cccccc">writeb(gpioie,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIE);</span>
	<span style="color: #cccccc">raw_spin_unlock(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock);</span>
<span style="color: #cccccc">}</span>

<span style="color: #000080">/**</span>
<span style="color: #000080"> * pl061_irq_ack() - ACK an edge IRQ</span>
<span style="color: #000080"> * @d: IRQ data for this IRQ</span>
<span style="color: #000080"> *</span>
<span style="color: #000080"> * This gets called from the edge IRQ handler to ACK the edge IRQ</span>
<span style="color: #000080"> * in the GPIOIC (interrupt-clear) register. For level IRQs this is</span>
<span style="color: #000080"> * not needed: these go away when the level signal goes away.</span>
<span style="color: #000080"> */</span>
<span style="color: #cdcd00">static</span> <span style="color: #00cd00">void</span> <span style="color: #cccccc">pl061_irq_ack(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">irq_data</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">d)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">gc</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">irq_data_get_irq_chip_data(d);</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_get_data(gc);</span>
	<span style="color: #cccccc">u8</span> <span style="color: #cccccc">mask</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">BIT(irqd_to_hwirq(d)</span> <span style="color: #3399cc">%</span> <span style="color: #cccccc">PL061_GPIO_NR);</span>

	<span style="color: #cccccc">raw_spin_lock(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock);</span>
	<span style="color: #cccccc">writeb(mask,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIC);</span>
	<span style="color: #cccccc">raw_spin_unlock(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock);</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">static</span> <span style="color: #00cd00">int</span> <span style="color: #cccccc">pl061_irq_set_wake(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">irq_data</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">d,</span> <span style="color: #00cd00">unsigned</span> <span style="color: #00cd00">int</span> <span style="color: #cccccc">state)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">gc</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">irq_data_get_irq_chip_data(d);</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_get_data(gc);</span>

	<span style="color: #cdcd00">return</span> <span style="color: #cccccc">irq_set_irq_wake(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">parent_irq,</span> <span style="color: #cccccc">state);</span>
<span style="color: #cccccc">}</span>







<span style="color: #cdcd00">static</span> <span style="color: #00cd00">int</span> <span style="color: #cccccc">pl061_probe(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">amba_device</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">adev,</span> <span style="color: #cdcd00">const</span> <span style="color: #cdcd00">struct</span> <span style="color: #cccccc">amba_id</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">id)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">device</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">dev</span> <span style="color: #3399cc">=</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">adev</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">dev;</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061;</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">gpio_irq_chip</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">girq;</span>
	<span style="color: #00cd00">int</span> <span style="color: #cccccc">ret,</span> <span style="color: #cccccc">irq;</span>

	<span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">devm_kzalloc(dev,</span> <span style="color: #cdcd00">sizeof</span><span style="color: #cccccc">(</span><span style="color: #3399cc">*</span><span style="color: #cccccc">pl061),</span> <span style="color: #cccccc">GFP_KERNEL);</span>
	<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(pl061</span> <span style="color: #3399cc">==</span> <span style="color: #cd00cd">NULL</span><span style="color: #cccccc">)</span>
		<span style="color: #cdcd00">return</span> <span style="color: #3399cc">-</span><span style="color: #cccccc">ENOMEM;</span>

	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">devm_ioremap_resource(dev,</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">adev</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">res);</span>
	<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(IS_ERR(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base))</span>
		<span style="color: #cdcd00">return</span> <span style="color: #cccccc">PTR_ERR(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base);</span>

	<span style="color: #cccccc">raw_spin_lock_init(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">lock);</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.request</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_generic_request;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.free</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">gpiochip_generic_free;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.base</span> <span style="color: #3399cc">=</span> <span style="color: #3399cc">-</span><span style="color: #cd00cd">1</span><span style="color: #cccccc">;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.get_direction</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_get_direction;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.direction_input</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_direction_input;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.direction_output</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_direction_output;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.get</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_get_value;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.set</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_set_value;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.ngpio</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">PL061_GPIO_NR;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.label</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">dev_name(dev);</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.parent</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">dev;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.owner</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">THIS_MODULE;</span>

	<span style="color: #000080">/*</span>
<span style="color: #000080">	 * irq_chip support</span>
<span style="color: #000080">	 */</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">irq_chip.name</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">dev_name(dev);</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">irq_chip.irq_ack</span>	<span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_irq_ack;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">irq_chip.irq_mask</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_irq_mask;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">irq_chip.irq_unmask</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_irq_unmask;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">irq_chip.irq_set_type</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_irq_type;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">irq_chip.irq_set_wake</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_irq_set_wake;</span>

	<span style="color: #cccccc">writeb(</span><span style="color: #cd00cd">0</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIE);</span> <span style="color: #000080">/* disable irqs */</span>
	<span style="color: #cccccc">irq</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">adev</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">irq[</span><span style="color: #cd00cd">0</span><span style="color: #cccccc">];</span>
	<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(</span><span style="color: #3399cc">!</span><span style="color: #cccccc">irq)</span>
		<span style="color: #cccccc">dev_warn(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">adev</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">dev,</span> <span style="color: #cd0000">&quot;IRQ support disabled\n&quot;</span><span style="color: #cccccc">);</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">parent_irq</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">irq;</span>

	<span style="color: #cccccc">girq</span> <span style="color: #3399cc">=</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc.irq;</span>
	<span style="color: #cccccc">girq</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">chip</span> <span style="color: #3399cc">=</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">irq_chip;</span>
	<span style="color: #cccccc">girq</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">parent_handler</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_irq_handler;</span>
	<span style="color: #cccccc">girq</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">num_parents</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">1</span><span style="color: #cccccc">;</span>
	<span style="color: #cccccc">girq</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">parents</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">devm_kcalloc(dev,</span> <span style="color: #cd00cd">1</span><span style="color: #cccccc">,</span> <span style="color: #cdcd00">sizeof</span><span style="color: #cccccc">(</span><span style="color: #3399cc">*</span><span style="color: #cccccc">girq</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">parents),</span>
				     <span style="color: #cccccc">GFP_KERNEL);</span>
	<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(</span><span style="color: #3399cc">!</span><span style="color: #cccccc">girq</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">parents)</span>
		<span style="color: #cdcd00">return</span> <span style="color: #3399cc">-</span><span style="color: #cccccc">ENOMEM;</span>
	<span style="color: #cccccc">girq</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">parents[</span><span style="color: #cd00cd">0</span><span style="color: #cccccc">]</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">irq;</span>
	<span style="color: #cccccc">girq</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">default_type</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">IRQ_TYPE_NONE;</span>
	<span style="color: #cccccc">girq</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">handler</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">handle_bad_irq;</span>

	<span style="color: #cccccc">ret</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">devm_gpiochip_add_data(dev,</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc,</span> <span style="color: #cccccc">pl061);</span>
	<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(ret)</span>
		<span style="color: #cdcd00">return</span> <span style="color: #cccccc">ret;</span>

	<span style="color: #cccccc">amba_set_drvdata(adev,</span> <span style="color: #cccccc">pl061);</span>
	<span style="color: #cccccc">dev_info(dev,</span> <span style="color: #cd0000">&quot;PL061 GPIO chip registered\n&quot;</span><span style="color: #cccccc">);</span>

	<span style="color: #cdcd00">return</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span>
<span style="color: #cccccc">}</span>

<span style="color: #000080">#ifdef CONFIG_PM</span>
<span style="color: #cdcd00">static</span> <span style="color: #00cd00">int</span> <span style="color: #cccccc">pl061_suspend(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">device</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">dev)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">dev_get_drvdata(dev);</span>
	<span style="color: #00cd00">int</span> <span style="color: #cccccc">offset;</span>

	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_data</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_dir</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIODIR);</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_is</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIS);</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_ibe</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIBE);</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_iev</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIEV);</span>
	<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_ie</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">readb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIE);</span>

	<span style="color: #cdcd00">for</span> <span style="color: #cccccc">(offset</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span> <span style="color: #cccccc">offset</span> <span style="color: #3399cc">&lt;</span> <span style="color: #cccccc">PL061_GPIO_NR;</span> <span style="color: #cccccc">offset</span><span style="color: #3399cc">++</span><span style="color: #cccccc">)</span> <span style="color: #cccccc">{</span>
		<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_dir</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">(BIT(offset)))</span>
			<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_data</span> <span style="color: #3399cc">|=</span>
				<span style="color: #cccccc">pl061_get_value(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc,</span> <span style="color: #cccccc">offset)</span> <span style="color: #3399cc">&lt;&lt;</span> <span style="color: #cccccc">offset;</span>
	<span style="color: #cccccc">}</span>

	<span style="color: #cdcd00">return</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">static</span> <span style="color: #00cd00">int</span> <span style="color: #cccccc">pl061_resume(</span><span style="color: #cdcd00">struct</span> <span style="color: #cccccc">device</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">dev)</span>
<span style="color: #cccccc">{</span>
	<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">*</span><span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">dev_get_drvdata(dev);</span>
	<span style="color: #00cd00">int</span> <span style="color: #cccccc">offset;</span>

	<span style="color: #cdcd00">for</span> <span style="color: #cccccc">(offset</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span> <span style="color: #cccccc">offset</span> <span style="color: #3399cc">&lt;</span> <span style="color: #cccccc">PL061_GPIO_NR;</span> <span style="color: #cccccc">offset</span><span style="color: #3399cc">++</span><span style="color: #cccccc">)</span> <span style="color: #cccccc">{</span>
		<span style="color: #cdcd00">if</span> <span style="color: #cccccc">(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_dir</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">(BIT(offset)))</span>
			<span style="color: #cccccc">pl061_direction_output(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc,</span> <span style="color: #cccccc">offset,</span>
					<span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_data</span> <span style="color: #3399cc">&amp;</span>
					<span style="color: #cccccc">(BIT(offset)));</span>
		<span style="color: #cdcd00">else</span>
			<span style="color: #cccccc">pl061_direction_input(</span><span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">gc,</span> <span style="color: #cccccc">offset);</span>
	<span style="color: #cccccc">}</span>

	<span style="color: #cccccc">writeb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_is,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIS);</span>
	<span style="color: #cccccc">writeb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_ibe,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIBE);</span>
	<span style="color: #cccccc">writeb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_iev,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIEV);</span>
	<span style="color: #cccccc">writeb(pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">csave_regs.gpio_ie,</span> <span style="color: #cccccc">pl061</span><span style="color: #3399cc">-&gt;</span><span style="color: #cccccc">base</span> <span style="color: #3399cc">+</span> <span style="color: #cccccc">GPIOIE);</span>

	<span style="color: #cdcd00">return</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">static</span> <span style="color: #cdcd00">const</span> <span style="color: #cdcd00">struct</span> <span style="color: #cccccc">dev_pm_ops</span> <span style="color: #cccccc">pl061_dev_pm_ops</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">{</span>
	<span style="color: #cccccc">.suspend</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_suspend,</span>
	<span style="color: #cccccc">.resume</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_resume,</span>
	<span style="color: #cccccc">.freeze</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_suspend,</span>
	<span style="color: #cccccc">.restore</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_resume,</span>
<span style="color: #cccccc">};</span>
<span style="color: #000080">#endif</span>

<span style="color: #cdcd00">static</span> <span style="color: #cdcd00">const</span> <span style="color: #cdcd00">struct</span> <span style="color: #cccccc">amba_id</span> <span style="color: #cccccc">pl061_ids[]</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">{</span>
	<span style="color: #cccccc">{</span>
		<span style="color: #cccccc">.id</span>	<span style="color: #3399cc">=</span> <span style="color: #cd00cd">0x00041061</span><span style="color: #cccccc">,</span>
		<span style="color: #cccccc">.mask</span>	<span style="color: #3399cc">=</span> <span style="color: #cd00cd">0x000fffff</span><span style="color: #cccccc">,</span>
	<span style="color: #cccccc">},</span>
	<span style="color: #cccccc">{</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">,</span> <span style="color: #cd00cd">0</span> <span style="color: #cccccc">},</span>
<span style="color: #cccccc">};</span>
<span style="color: #cccccc">MODULE_DEVICE_TABLE(amba,</span> <span style="color: #cccccc">pl061_ids);</span>

<span style="color: #cdcd00">static</span> <span style="color: #cdcd00">struct</span> <span style="color: #cccccc">amba_driver</span> <span style="color: #cccccc">pl061_gpio_driver</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">{</span>
	<span style="color: #cccccc">.drv</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">{</span>
		<span style="color: #cccccc">.name</span>	<span style="color: #3399cc">=</span> <span style="color: #cd0000">&quot;pl061_gpio&quot;</span><span style="color: #cccccc">,</span>
<span style="color: #000080">#ifdef CONFIG_PM</span>
		<span style="color: #cccccc">.pm</span>	<span style="color: #3399cc">=</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">pl061_dev_pm_ops,</span>
<span style="color: #000080">#endif</span>
	<span style="color: #cccccc">},</span>
	<span style="color: #cccccc">.id_table</span>	<span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_ids,</span>
	<span style="color: #cccccc">.probe</span>		<span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061_probe,</span>
<span style="color: #cccccc">};</span>
<span style="color: #cccccc">module_amba_driver(pl061_gpio_driver);</span>

<span style="color: #cccccc">MODULE_LICENSE(</span><span style="color: #cd0000">&quot;GPL v2&quot;</span><span style="color: #cccccc">);</span>
</pre></td></tr></table></div>
<!-- HTML generated using hilite.me --><div style="background: #000000; overflow:auto;float:left;width:50%;box-sizing:border-box;"><table><tr><td><pre style="margin: 0; line-height: 125%">  1
  2
  3
  4
  5
  6
  7
  8
  9

 10
 11
 12
 13
 14
 15
 16
 17
 18
 19







 20
 21
 22
 23
 24
 25
 26
 27
 28
 29
 30
 31
 32
 33
 34
 35
 36
 37
 38
 39
 40
 41
 42
 43
 44
 45
 46
 47
 48
 49
 50
 51
 52
 53
 54
 55
 56
 57
 58
 59
 60
 61
 62
 63
 64
 65
 66
 67
 68
 69
 70
 71

 72
 73
 74
 75
 76
 77
 78
 79
 80
 81






 82
 83
 84
 85
 86
 87
 88
 89
 90
 91
 92
 93
 94
 95








 96
 97
 98
 99
100


101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124



125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206
207
208
209
210


211
212
213
214
215
216
217
218
219




220
221
222
223
224
225
226
227
228








229
230
231
232
233
234
235
236
237
238
239




240
241
242
243
244
245
246
247
248
249
250
251
252
253
254
255
256
257
258
259
260
261
262
263
264
265
266
267
268
269
270
271
272
273
274
275
276
277
278
279
280
281
282
283
284
285
286
287
288
289
290
291
292
293
294



























295
296
297
298
299
300
301
302
303
304
305
306
307
308
309
310
311
312
313
314
315
316
317
318
319
320
321
322
323
324
325
326
327
328
329
330
331
332
333
334
335
336
337
338
339
340
341
342
343
344
345



















346
347
348
349
350
351</pre></td><td><pre style="margin: 0; line-height: 125%"><span style="color: #000080">// SPDX-License-Identifier: GPL-2.0</span>

<span style="color: #000080">//! Driver for the ARM PrimeCell(tm) General Purpose Input/Output (PL061).</span>
<span style="color: #000080">//!</span>
<span style="color: #000080">//! Based on the C driver written by Baruch Siach &lt;baruch@tkos.co.il&gt;.</span>

<span style="color: #cccccc;">#</span><span style="color: #3399cc">!</span><span style="color: #cccccc">[no_std]</span>
<span style="color: #cccccc;">#</span><span style="color: #3399cc">!</span><span style="color: #cccccc">[feature(global_asm,</span> <span style="color: #cccccc">allocator_api)]</span>


<span style="color: #cdcd00">use</span> <span style="color: #cccccc">core</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ops</span><span style="color: #3399cc">::</span><span style="color: #cccccc">DerefMut;</span>
<span style="color: #cdcd00">use</span> <span style="color: #cccccc">kernel</span><span style="color: #3399cc">::</span><span style="color: #cccccc">{</span>
    <span style="color: #cccccc">amba,</span> <span style="color: #cccccc">bit,</span> <span style="color: #cccccc">declare_id_table,</span> <span style="color: #cccccc">device,</span> <span style="color: #cccccc">gpio,</span>
    <span style="color: #cccccc">io_mem</span><span style="color: #3399cc">::</span><span style="color: #cccccc">IoMem,</span>
    <span style="color: #cccccc">irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">{self,</span> <span style="color: #cccccc">IrqData,</span> <span style="color: #cccccc">LockedIrqData},</span>
    <span style="color: #cccccc">power,</span>
    <span style="color: #cccccc">prelude</span><span style="color: #3399cc">::*</span><span style="color: #cccccc">,</span>
    <span style="color: #cccccc">sync</span><span style="color: #3399cc">::</span><span style="color: #cccccc">{IrqDisableSpinLock,</span> <span style="color: #cccccc">Ref},</span>
<span style="color: #cccccc">};</span>








<span style="color: #cdcd00">const</span> <span style="color: #cccccc">GPIODIR</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">usize</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">0x400</span><span style="color: #cccccc">;</span>
<span style="color: #cdcd00">const</span> <span style="color: #cccccc">GPIOIS</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">usize</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">0x404</span><span style="color: #cccccc">;</span>
<span style="color: #cdcd00">const</span> <span style="color: #cccccc">GPIOIBE</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">usize</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">0x408</span><span style="color: #cccccc">;</span>
<span style="color: #cdcd00">const</span> <span style="color: #cccccc">GPIOIEV</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">usize</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">0x40C</span><span style="color: #cccccc">;</span>
<span style="color: #cdcd00">const</span> <span style="color: #cccccc">GPIOIE</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">usize</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">0x410</span><span style="color: #cccccc">;</span>
<span style="color: #cdcd00">const</span> <span style="color: #cccccc">GPIOMIS</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">usize</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">0x418</span><span style="color: #cccccc">;</span>
<span style="color: #cdcd00">const</span> <span style="color: #cccccc">GPIOIC</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">usize</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">0x41C</span><span style="color: #cccccc">;</span>
<span style="color: #cdcd00">const</span> <span style="color: #cccccc">GPIO_SIZE</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">usize</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">0x1000</span><span style="color: #cccccc">;</span>

<span style="color: #cdcd00">const</span> <span style="color: #cccccc">PL061_GPIO_NR</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u16</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">8</span><span style="color: #cccccc">;</span>

<span style="color: #000080">#[derive(Default)]</span>
<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">ContextSaveRegs</span> <span style="color: #cccccc">{</span>
    <span style="color: #cccccc">gpio_data</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u8</span><span style="color: #cccccc">,</span>
    <span style="color: #cccccc">gpio_dir</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u8</span><span style="color: #cccccc">,</span>
    <span style="color: #cccccc">gpio_is</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u8</span><span style="color: #cccccc">,</span>
    <span style="color: #cccccc">gpio_ibe</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u8</span><span style="color: #cccccc">,</span>
    <span style="color: #cccccc">gpio_iev</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u8</span><span style="color: #cccccc">,</span>
    <span style="color: #cccccc">gpio_ie</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u8</span><span style="color: #cccccc">,</span>
<span style="color: #cccccc">}</span>

<span style="color: #000080">#[derive(Default)]</span>
<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">PL061Data</span> <span style="color: #cccccc">{</span>
    <span style="color: #cccccc">csave_regs</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">ContextSaveRegs,</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">PL061Resources</span> <span style="color: #cccccc">{</span>
    <span style="color: #cccccc">base</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">IoMem</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">GPIO_SIZE</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span>
    <span style="color: #cccccc">parent_irq</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u32</span><span style="color: #cccccc">,</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">PL061Registrations</span> <span style="color: #cccccc">{</span>
    <span style="color: #cccccc">gpio_chip</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">gpio</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ChipRegistration</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">PL061Device</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">type</span> <span style="color: #cccccc">DeviceData</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">device</span><span style="color: #3399cc">::</span><span style="color: #cccccc">Data</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">PL061Registrations,</span> <span style="color: #cccccc">PL061Resources,</span> <span style="color: #cccccc">IrqDisableSpinLock</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">PL061Data</span><span style="color: #3399cc">&gt;&gt;</span><span style="color: #cccccc">;</span>

<span style="color: #cdcd00">struct</span> <span style="color: #cccccc">PL061Device;</span>

<span style="color: #cdcd00">impl</span> <span style="color: #cccccc">gpio</span><span style="color: #3399cc">::</span><span style="color: #cccccc">Chip</span> <span style="color: #cdcd00">for</span> <span style="color: #cccccc">PL061Device</span> <span style="color: #cccccc">{</span>
    <span style="color: #cdcd00">type</span> <span style="color: #cccccc">IrqChip</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">Self;</span>
    <span style="color: #cdcd00">type</span> <span style="color: #cccccc">Data</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">;</span>

    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">get_direction(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">offset</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u32</span><span style="color: #cccccc">)</span> <span style="color: #3399cc">-&gt;</span> <span style="color: #cccccc">Result</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">gpio</span><span style="color: #3399cc">::</span><span style="color: #cccccc">LineDirection</span><span style="color: #3399cc">&gt;</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources().ok_or(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ENXIO)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>
        <span style="color: #cccccc">Ok(</span><span style="color: #cdcd00">if</span> <span style="color: #cccccc">pl061.base.readb(GPIODIR)</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">bit(offset)</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span> <span style="color: #cccccc">{</span>
            <span style="color: #cccccc">gpio</span><span style="color: #3399cc">::</span><span style="color: #cccccc">LineDirection</span><span style="color: #3399cc">::</span><span style="color: #cccccc">Out</span>
        <span style="color: #cccccc">}</span> <span style="color: #cdcd00">else</span> <span style="color: #cccccc">{</span>
            <span style="color: #cccccc">gpio</span><span style="color: #3399cc">::</span><span style="color: #cccccc">LineDirection</span><span style="color: #3399cc">::</span><span style="color: #cccccc">In</span>
        <span style="color: #cccccc">})</span>
    <span style="color: #cccccc">}</span>


    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">direction_input(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">offset</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u32</span><span style="color: #cccccc">)</span> <span style="color: #3399cc">-&gt;</span> <span style="color: #cccccc">Result</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">_guard</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.lock();</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources().ok_or(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ENXIO)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cdcd00">mut</span> <span style="color: #cccccc">gpiodir</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIODIR);</span>
        <span style="color: #cccccc">gpiodir</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">!</span><span style="color: #cccccc">bit(offset);</span>
        <span style="color: #cccccc">pl061.base.writeb(gpiodir,</span> <span style="color: #cccccc">GPIODIR);</span>
        <span style="color: #cccccc">Ok(())</span>
    <span style="color: #cccccc">}</span>







    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">direction_output(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">offset</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u32</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">value</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">bool)</span> <span style="color: #3399cc">-&gt;</span> <span style="color: #cccccc">Result</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">woffset</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">bit(offset</span> <span style="color: #3399cc">+</span> <span style="color: #cd00cd">2</span><span style="color: #cccccc">).into();</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">_guard</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.lock();</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources().ok_or(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ENXIO)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>
        <span style="color: #cccccc">pl061.base.try_writeb((value</span> <span style="color: #cdcd00">as</span> <span style="color: #cdcd00">u8</span><span style="color: #cccccc">)</span> <span style="color: #3399cc">&lt;&lt;</span> <span style="color: #cccccc">offset,</span> <span style="color: #cccccc">woffset)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cdcd00">mut</span> <span style="color: #cccccc">gpiodir</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIODIR);</span>
        <span style="color: #cccccc">gpiodir</span> <span style="color: #3399cc">|=</span> <span style="color: #cccccc">bit(offset);</span>
        <span style="color: #cccccc">pl061.base.writeb(gpiodir,</span> <span style="color: #cccccc">GPIODIR);</span>

        <span style="color: #000080">// gpio value is set again, because pl061 doesn&#39;t allow to set value of a gpio pin before</span>
        <span style="color: #000080">// configuring it in OUT mode.</span>
        <span style="color: #cccccc">pl061.base.try_writeb((value</span> <span style="color: #cdcd00">as</span> <span style="color: #cdcd00">u8</span><span style="color: #cccccc">)</span> <span style="color: #3399cc">&lt;&lt;</span> <span style="color: #cccccc">offset,</span> <span style="color: #cccccc">woffset)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>
        <span style="color: #cccccc">Ok(())</span>
    <span style="color: #cccccc">}</span>









    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">get(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">offset</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u32</span><span style="color: #cccccc">)</span> <span style="color: #3399cc">-&gt;</span> <span style="color: #cccccc">Result</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">bool</span><span style="color: #3399cc">&gt;</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources().ok_or(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ENXIO)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>
        <span style="color: #cccccc">Ok(pl061.base.try_readb(bit(offset</span> <span style="color: #3399cc">+</span> <span style="color: #cd00cd">2</span><span style="color: #cccccc">).into())</span><span style="color: #3399cc">?</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">)</span>
    <span style="color: #cccccc">}</span>



    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">set(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">offset</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u32</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">value</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">bool)</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">if</span> <span style="color: #cdcd00">let</span> <span style="color: #cccccc">Some(pl061)</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources()</span> <span style="color: #cccccc">{</span>
            <span style="color: #cdcd00">let</span> <span style="color: #cccccc">woffset</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">bit(offset</span> <span style="color: #3399cc">+</span> <span style="color: #cd00cd">2</span><span style="color: #cccccc">).into();</span>
            <span style="color: #cdcd00">let</span> <span style="color: #cccccc">_</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.try_writeb((value</span> <span style="color: #cdcd00">as</span> <span style="color: #cdcd00">u8</span><span style="color: #cccccc">)</span> <span style="color: #3399cc">&lt;&lt;</span> <span style="color: #cccccc">offset,</span> <span style="color: #cccccc">woffset);</span>
        <span style="color: #cccccc">}</span>
    <span style="color: #cccccc">}</span>

    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">irq_route(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">router</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">gpio</span><span style="color: #3399cc">::</span><span style="color: #cccccc">IrqRouter)</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">if</span> <span style="color: #cdcd00">let</span> <span style="color: #cccccc">Some(pl061)</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources()</span> <span style="color: #cccccc">{</span>
            <span style="color: #cdcd00">let</span> <span style="color: #cccccc">pending</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIOMIS);</span>
            <span style="color: #cdcd00">if</span> <span style="color: #cccccc">pending</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span> <span style="color: #cccccc">{</span>
                <span style="color: #cdcd00">for</span> <span style="color: #cccccc">offset</span> <span style="color: #cccccc">in</span> <span style="color: #cd00cd">0.</span><span style="color: #cccccc">.PL061_GPIO_NR</span> <span style="color: #cccccc">{</span>
                    <span style="color: #cdcd00">if</span> <span style="color: #cccccc">pending</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">bit(offset)</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span> <span style="color: #cccccc">{</span>
                        <span style="color: #cccccc">router.deliver(offset.into());</span>
                    <span style="color: #cccccc">}</span>
                <span style="color: #cccccc">}</span>
            <span style="color: #cccccc">}</span>
        <span style="color: #cccccc">}</span>
    <span style="color: #cccccc">}</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">impl</span> <span style="color: #cccccc">irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">Chip</span> <span style="color: #cdcd00">for</span> <span style="color: #cccccc">PL061Device</span> <span style="color: #cccccc">{</span>
    <span style="color: #cdcd00">type</span> <span style="color: #cccccc">Data</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">;</span>




    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">set_type(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">irq_data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cdcd00">mut</span> <span style="color: #cccccc">LockedIrqData,</span> <span style="color: #cccccc">trigger</span><span style="color: #3399cc">:</span> <span style="color: #cdcd00">u32</span><span style="color: #cccccc">)</span> <span style="color: #3399cc">-&gt;</span> <span style="color: #cccccc">Result</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">offset</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">irq_data.hwirq();</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">bit</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">bit(offset);</span>

        <span style="color: #cdcd00">if</span> <span style="color: #cccccc">offset</span> <span style="color: #3399cc">&gt;=</span> <span style="color: #cccccc">PL061_GPIO_NR.into()</span> <span style="color: #cccccc">{</span>
            <span style="color: #cdcd00">return</span> <span style="color: #cccccc">Err(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">EINVAL);</span>
        <span style="color: #cccccc">}</span>

        <span style="color: #cdcd00">if</span> <span style="color: #cccccc">trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">(irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">TYPE_LEVEL_HIGH</span> <span style="color: #3399cc">|</span> <span style="color: #cccccc">irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">TYPE_LEVEL_LOW)</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span>
            <span style="color: #3399cc">&amp;&amp;</span> <span style="color: #cccccc">trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">(irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">TYPE_EDGE_RISING</span> <span style="color: #3399cc">|</span> <span style="color: #cccccc">irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">TYPE_EDGE_FALLING)</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span>
        <span style="color: #cccccc">{</span>
            <span style="color: #cccccc">pr_err</span><span style="color: #3399cc">!</span><span style="color: #cccccc">(</span>
                <span style="color: #cd0000">&quot;trying to configure line {} for both level and edge detection, choose one!\n&quot;</span><span style="color: #cccccc">,</span>
                <span style="color: #cccccc">offset</span>
            <span style="color: #cccccc">);</span>
            <span style="color: #cdcd00">return</span> <span style="color: #cccccc">Err(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">EINVAL);</span>
        <span style="color: #cccccc">}</span>

        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">_guard</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.lock();</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources().ok_or(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ENXIO)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>

        <span style="color: #cdcd00">let</span> <span style="color: #cdcd00">mut</span> <span style="color: #cccccc">gpioiev</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIOIEV);</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cdcd00">mut</span> <span style="color: #cccccc">gpiois</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIOIS);</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cdcd00">mut</span> <span style="color: #cccccc">gpioibe</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIOIBE);</span>

        <span style="color: #cdcd00">if</span> <span style="color: #cccccc">trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">(irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">TYPE_LEVEL_HIGH</span> <span style="color: #3399cc">|</span> <span style="color: #cccccc">irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">TYPE_LEVEL_LOW)</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span> <span style="color: #cccccc">{</span>
            <span style="color: #cdcd00">let</span> <span style="color: #cccccc">polarity</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">TYPE_LEVEL_HIGH</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span>

            <span style="color: #000080">// Disable edge detection.</span>
            <span style="color: #cccccc">gpioibe</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">!</span><span style="color: #cccccc">bit;</span>
            <span style="color: #000080">// Enable level detection.</span>
            <span style="color: #cccccc">gpiois</span> <span style="color: #3399cc">|=</span> <span style="color: #cccccc">bit;</span>
            <span style="color: #000080">// Select polarity.</span>
            <span style="color: #cdcd00">if</span> <span style="color: #cccccc">polarity</span> <span style="color: #cccccc">{</span>
                <span style="color: #cccccc">gpioiev</span> <span style="color: #3399cc">|=</span> <span style="color: #cccccc">bit;</span>
            <span style="color: #cccccc">}</span> <span style="color: #cdcd00">else</span> <span style="color: #cccccc">{</span>
                <span style="color: #cccccc">gpioiev</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">!</span><span style="color: #cccccc">bit;</span>
            <span style="color: #cccccc">}</span>
            <span style="color: #cccccc">irq_data.set_level_handler();</span>
            <span style="color: #cccccc">pr_debug</span><span style="color: #3399cc">!</span><span style="color: #cccccc">(</span>
                <span style="color: #cd0000">&quot;line {}: IRQ on {} level\n&quot;</span><span style="color: #cccccc">,</span>
                <span style="color: #cccccc">offset,</span>
                <span style="color: #cdcd00">if</span> <span style="color: #cccccc">polarity</span> <span style="color: #cccccc">{</span> <span style="color: #cd0000">&quot;HIGH&quot;</span> <span style="color: #cccccc">}</span> <span style="color: #cdcd00">else</span> <span style="color: #cccccc">{</span> <span style="color: #cd0000">&quot;LOW&quot;</span> <span style="color: #cccccc">}</span>
            <span style="color: #cccccc">);</span>
        <span style="color: #cccccc">}</span> <span style="color: #cdcd00">else</span> <span style="color: #cdcd00">if</span> <span style="color: #cccccc">(trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">TYPE_EDGE_BOTH)</span> <span style="color: #3399cc">==</span> <span style="color: #cccccc">irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">TYPE_EDGE_BOTH</span> <span style="color: #cccccc">{</span>
            <span style="color: #000080">// Disable level detection.</span>
            <span style="color: #cccccc">gpiois</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">!</span><span style="color: #cccccc">bit;</span>
            <span style="color: #000080">// Select both edges, settings this makes GPIOEV be ignored.</span>
            <span style="color: #cccccc">gpioibe</span> <span style="color: #3399cc">|=</span> <span style="color: #cccccc">bit;</span>
            <span style="color: #cccccc">irq_data.set_edge_handler();</span>
            <span style="color: #cccccc">pr_debug</span><span style="color: #3399cc">!</span><span style="color: #cccccc">(</span><span style="color: #cd0000">&quot;line {}: IRQ on both edges\n&quot;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">offset);</span>
        <span style="color: #cccccc">}</span> <span style="color: #cdcd00">else</span> <span style="color: #cdcd00">if</span> <span style="color: #cccccc">trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">(irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">TYPE_EDGE_RISING</span> <span style="color: #3399cc">|</span> <span style="color: #cccccc">irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">TYPE_EDGE_FALLING)</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span> <span style="color: #cccccc">{</span>
            <span style="color: #cdcd00">let</span> <span style="color: #cccccc">rising</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">trigger</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">TYPE_EDGE_RISING</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span>

            <span style="color: #000080">// Disable level detection.</span>
            <span style="color: #cccccc">gpiois</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">!</span><span style="color: #cccccc">bit;</span>
            <span style="color: #000080">// Clear detection on both edges.</span>
            <span style="color: #cccccc">gpioibe</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">!</span><span style="color: #cccccc">bit;</span>
            <span style="color: #000080">// Select edge.</span>
            <span style="color: #cdcd00">if</span> <span style="color: #cccccc">rising</span> <span style="color: #cccccc">{</span>
                <span style="color: #cccccc">gpioiev</span> <span style="color: #3399cc">|=</span> <span style="color: #cccccc">bit;</span>
            <span style="color: #cccccc">}</span> <span style="color: #cdcd00">else</span> <span style="color: #cccccc">{</span>
                <span style="color: #cccccc">gpioiev</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">!</span><span style="color: #cccccc">bit;</span>
            <span style="color: #cccccc">}</span>
            <span style="color: #cccccc">irq_data.set_edge_handler();</span>
            <span style="color: #cccccc">pr_debug</span><span style="color: #3399cc">!</span><span style="color: #cccccc">(</span>
                <span style="color: #cd0000">&quot;line {}: IRQ on {} edge\n&quot;</span><span style="color: #cccccc">,</span>
                <span style="color: #cccccc">offset,</span>
                <span style="color: #cdcd00">if</span> <span style="color: #cccccc">rising</span> <span style="color: #cccccc">{</span> <span style="color: #cd0000">&quot;RISING&quot;</span> <span style="color: #cccccc">}</span> <span style="color: #cdcd00">else</span> <span style="color: #cccccc">{</span> <span style="color: #cd0000">&quot;FALLING}&quot;</span> <span style="color: #cccccc">}</span>
            <span style="color: #cccccc">);</span>
        <span style="color: #cccccc">}</span> <span style="color: #cdcd00">else</span> <span style="color: #cccccc">{</span>
            <span style="color: #000080">// No trigger: disable everything.</span>
            <span style="color: #cccccc">gpiois</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">!</span><span style="color: #cccccc">bit;</span>
            <span style="color: #cccccc">gpioibe</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">!</span><span style="color: #cccccc">bit;</span>
            <span style="color: #cccccc">gpioiev</span> <span style="color: #3399cc">&amp;=</span> <span style="color: #3399cc">!</span><span style="color: #cccccc">bit;</span>
            <span style="color: #cccccc">irq_data.set_bad_handler();</span>
            <span style="color: #cccccc">pr_warn</span><span style="color: #3399cc">!</span><span style="color: #cccccc">(</span><span style="color: #cd0000">&quot;no trigger selected for line {}\n&quot;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">offset);</span>
        <span style="color: #cccccc">}</span>

        <span style="color: #cccccc">pl061.base.writeb(gpioiev,</span> <span style="color: #cccccc">GPIOIEV);</span>
        <span style="color: #cccccc">pl061.base.writeb(gpiois,</span> <span style="color: #cccccc">GPIOIS);</span>
        <span style="color: #cccccc">pl061.base.writeb(gpioibe,</span> <span style="color: #cccccc">GPIOIBE);</span>

        <span style="color: #cccccc">Ok(())</span>
    <span style="color: #cccccc">}</span>



    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">mask(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">irq_data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">IrqData)</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">mask</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">bit(irq_data.hwirq()</span> <span style="color: #3399cc">%</span> <span style="color: #cdcd00">u64</span><span style="color: #3399cc">::</span><span style="color: #cccccc">from(PL061_GPIO_NR));</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">_guard</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.lock();</span>
        <span style="color: #cdcd00">if</span> <span style="color: #cdcd00">let</span> <span style="color: #cccccc">Some(pl061)</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources()</span> <span style="color: #cccccc">{</span>
            <span style="color: #cdcd00">let</span> <span style="color: #cccccc">gpioie</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIOIE)</span> <span style="color: #3399cc">&amp;</span> <span style="color: #3399cc">!</span><span style="color: #cccccc">mask;</span>
            <span style="color: #cdcd00">let</span> <span style="color: #cccccc">_</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.try_writeb(gpioie,</span> <span style="color: #cccccc">GPIOIE);</span>
        <span style="color: #cccccc">}</span>
    <span style="color: #cccccc">}</span>





    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">unmask(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">irq_data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">IrqData)</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">mask</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">bit(irq_data.hwirq()</span> <span style="color: #3399cc">%</span> <span style="color: #cdcd00">u64</span><span style="color: #3399cc">::</span><span style="color: #cccccc">from(PL061_GPIO_NR));</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">_guard</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.lock();</span>
        <span style="color: #cdcd00">if</span> <span style="color: #cdcd00">let</span> <span style="color: #cccccc">Some(pl061)</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources()</span> <span style="color: #cccccc">{</span>
            <span style="color: #cdcd00">let</span> <span style="color: #cccccc">gpioie</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIOIE)</span> <span style="color: #3399cc">|</span> <span style="color: #cccccc">mask;</span>
            <span style="color: #cdcd00">let</span> <span style="color: #cccccc">_</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.try_writeb(gpioie,</span> <span style="color: #cccccc">GPIOIE);</span>
        <span style="color: #cccccc">}</span>
    <span style="color: #cccccc">}</span>









    <span style="color: #000080">// This gets called from the edge IRQ handler to ACK the edge IRQ in the GPIOIC</span>
    <span style="color: #000080">// (interrupt-clear) register. For level IRQs this is not needed: these go away when the level</span>
    <span style="color: #000080">// signal goes away.</span>
    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">ack(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">irq_data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">IrqData)</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">mask</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">bit(irq_data.hwirq()</span> <span style="color: #3399cc">%</span> <span style="color: #cdcd00">u64</span><span style="color: #3399cc">::</span><span style="color: #cccccc">from(PL061_GPIO_NR));</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">_guard</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.lock();</span>
        <span style="color: #cdcd00">if</span> <span style="color: #cdcd00">let</span> <span style="color: #cccccc">Some(pl061)</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources()</span> <span style="color: #cccccc">{</span>
            <span style="color: #cdcd00">let</span> <span style="color: #cccccc">_</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.try_writeb(mask.into(),</span> <span style="color: #cccccc">GPIOIC);</span>
        <span style="color: #cccccc">}</span>
    <span style="color: #cccccc">}</span>





    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">set_wake(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">_irq_data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">IrqData,</span> <span style="color: #cccccc">on</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">bool)</span> <span style="color: #3399cc">-&gt;</span> <span style="color: #cccccc">Result</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources().ok_or(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ENXIO)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>
        <span style="color: #cccccc">irq</span><span style="color: #3399cc">::</span><span style="color: #cccccc">set_irq_wake(pl061.parent_irq,</span> <span style="color: #cccccc">on)</span>
    <span style="color: #cccccc">}</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">impl</span> <span style="color: #cccccc">amba</span><span style="color: #3399cc">::</span><span style="color: #cccccc">Driver</span> <span style="color: #cdcd00">for</span> <span style="color: #cccccc">PL061Device</span> <span style="color: #cccccc">{</span>
    <span style="color: #cdcd00">type</span> <span style="color: #cccccc">InnerData</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">DeviceData;</span>
    <span style="color: #cdcd00">type</span> <span style="color: #cccccc">PowerOps</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">Self;</span>

    <span style="color: #cccccc">declare_id_table</span><span style="color: #3399cc">!</span> <span style="color: #cccccc">{</span>
        <span style="color: #cccccc">(</span><span style="color: #cd00cd">0x00041061</span><span style="color: #cccccc">,</span> <span style="color: #cd00cd">0x000fffff</span><span style="color: #cccccc">),</span>
    <span style="color: #cccccc">}</span>

    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">probe(</span>
        <span style="color: #cccccc">dev</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cdcd00">mut</span> <span style="color: #cccccc">amba</span><span style="color: #3399cc">::</span><span style="color: #cccccc">Device,</span>
        <span style="color: #cccccc">_id</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">(</span><span style="color: #cdcd00">u32</span><span style="color: #cccccc">,</span> <span style="color: #cdcd00">u32</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">Option</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">Self</span><span style="color: #3399cc">::</span><span style="color: #cccccc">IdInfo</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">),</span>
    <span style="color: #cccccc">)</span> <span style="color: #3399cc">-&gt;</span> <span style="color: #cccccc">Result</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;&gt;</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">res</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">dev.take_resource().ok_or(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ENXIO)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">irq</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">dev.irq(</span><span style="color: #cd00cd">0</span><span style="color: #cccccc">).ok_or(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ENXIO)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>

        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">data</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">Ref</span><span style="color: #3399cc">::</span><span style="color: #cccccc">try_new_and_init(</span>
            <span style="color: #cccccc">device</span><span style="color: #3399cc">::</span><span style="color: #cccccc">Data</span><span style="color: #3399cc">::</span><span style="color: #cccccc">new(</span>
                <span style="color: #cccccc">PL061Registrations</span> <span style="color: #cccccc">{</span>
                    <span style="color: #cccccc">gpio_chip</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">gpio</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ChipRegistration</span><span style="color: #3399cc">::</span><span style="color: #cccccc">default(),</span>
                <span style="color: #cccccc">},</span>
                <span style="color: #cccccc">PL061Resources</span> <span style="color: #cccccc">{</span>
                    <span style="color: #cccccc">base</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">IoMem</span><span style="color: #3399cc">::</span><span style="color: #cccccc">try_new(res)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">,</span>
                    <span style="color: #cccccc">parent_irq</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">irq,</span>
                <span style="color: #cccccc">},</span>
                <span style="color: #000080">// SAFETY: We call `irqsave_spinlock_init` below.</span>
                <span style="color: #cdcd00">unsafe</span> <span style="color: #cccccc">{</span> <span style="color: #cccccc">IrqDisableSpinLock</span><span style="color: #3399cc">::</span><span style="color: #cccccc">new(PL061Data</span><span style="color: #3399cc">::</span><span style="color: #cccccc">default())</span> <span style="color: #cccccc">},</span>
            <span style="color: #cccccc">),</span>
            <span style="color: #3399cc">|</span><span style="color: #cdcd00">mut</span> <span style="color: #cccccc">data</span><span style="color: #3399cc">|</span> <span style="color: #cccccc">{</span>
                <span style="color: #000080">// SAFETY: General part of the data is pinned when `data` is.</span>
                <span style="color: #cdcd00">let</span> <span style="color: #cccccc">gen</span> <span style="color: #3399cc">=</span> <span style="color: #cdcd00">unsafe</span> <span style="color: #cccccc">{</span> <span style="color: #cccccc">data.as_mut().map_unchecked_mut(</span><span style="color: #3399cc">|</span><span style="color: #cccccc">d</span><span style="color: #3399cc">|</span> <span style="color: #cccccc">d.deref_mut())</span> <span style="color: #cccccc">};</span>
                <span style="color: #cccccc">kernel</span><span style="color: #3399cc">::</span><span style="color: #cccccc">irqdisable_spinlock_init</span><span style="color: #3399cc">!</span><span style="color: #cccccc">(gen,</span> <span style="color: #cd0000">&quot;PL061::General&quot;</span><span style="color: #cccccc">);</span>
            <span style="color: #cccccc">},</span>
        <span style="color: #cccccc">)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>

        <span style="color: #cccccc">data.resources().ok_or(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ENXIO)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">.base.writeb(</span><span style="color: #cd00cd">0</span><span style="color: #cccccc">,</span> <span style="color: #cccccc">GPIOIE);</span> <span style="color: #000080">// disable irqs</span>
        <span style="color: #cccccc">data.registrations()</span>
            <span style="color: #cccccc">.ok_or(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ENXIO)</span><span style="color: #3399cc">?</span>
            <span style="color: #cccccc">.gpio_chip</span>
            <span style="color: #cccccc">.register_with_irq(PL061_GPIO_NR,</span> <span style="color: #cccccc">None,</span> <span style="color: #cccccc">dev,</span> <span style="color: #cccccc">data.clone(),</span> <span style="color: #cccccc">irq)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>

        <span style="color: #cccccc">pr_info</span><span style="color: #3399cc">!</span><span style="color: #cccccc">(</span><span style="color: #cd0000">&quot;PL061 GPIO chip registered\n&quot;</span><span style="color: #cccccc">);</span>

        <span style="color: #cccccc">Ok(data)</span>
    <span style="color: #cccccc">}</span>
<span style="color: #cccccc">}</span>

<span style="color: #cdcd00">impl</span> <span style="color: #cccccc">power</span><span style="color: #3399cc">::</span><span style="color: #cccccc">Operations</span> <span style="color: #cdcd00">for</span> <span style="color: #cccccc">PL061Device</span> <span style="color: #cccccc">{</span>
    <span style="color: #cdcd00">type</span> <span style="color: #cccccc">Data</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">;</span>




























    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">suspend(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">)</span> <span style="color: #3399cc">-&gt;</span> <span style="color: #cccccc">Result</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cdcd00">mut</span> <span style="color: #cccccc">inner</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.lock();</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources().ok_or(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ENXIO)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>
        <span style="color: #cccccc">inner.csave_regs.gpio_data</span> <span style="color: #3399cc">=</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span>
        <span style="color: #cccccc">inner.csave_regs.gpio_dir</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIODIR);</span>
        <span style="color: #cccccc">inner.csave_regs.gpio_is</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIOIS);</span>
        <span style="color: #cccccc">inner.csave_regs.gpio_ibe</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIOIBE);</span>
        <span style="color: #cccccc">inner.csave_regs.gpio_iev</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIOIEV);</span>
        <span style="color: #cccccc">inner.csave_regs.gpio_ie</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">pl061.base.readb(GPIOIE);</span>

        <span style="color: #cdcd00">for</span> <span style="color: #cccccc">offset</span> <span style="color: #cccccc">in</span> <span style="color: #cd00cd">0.</span><span style="color: #cccccc">.PL061_GPIO_NR</span> <span style="color: #cccccc">{</span>
            <span style="color: #cdcd00">if</span> <span style="color: #cccccc">inner.csave_regs.gpio_dir</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">bit(offset)</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span> <span style="color: #cccccc">{</span>
                <span style="color: #cdcd00">if</span> <span style="color: #cdcd00">let</span> <span style="color: #cccccc">Ok(v)</span> <span style="color: #3399cc">=</span> <span style="color: #3399cc">&lt;</span><span style="color: #cccccc">Self</span> <span style="color: #cdcd00">as</span> <span style="color: #cccccc">gpio</span><span style="color: #3399cc">::</span><span style="color: #cccccc">Chip</span><span style="color: #3399cc">&gt;::</span><span style="color: #cccccc">get(data,</span> <span style="color: #cccccc">offset.into())</span> <span style="color: #cccccc">{</span>
                    <span style="color: #cccccc">inner.csave_regs.gpio_data</span> <span style="color: #3399cc">|=</span> <span style="color: #cccccc">(v</span> <span style="color: #cdcd00">as</span> <span style="color: #cdcd00">u8</span><span style="color: #cccccc">)</span> <span style="color: #3399cc">&lt;&lt;</span> <span style="color: #cccccc">offset;</span>
                <span style="color: #cccccc">}</span>
            <span style="color: #cccccc">}</span>
        <span style="color: #cccccc">}</span>

        <span style="color: #cccccc">Ok(())</span>
    <span style="color: #cccccc">}</span>

    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">resume(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">)</span> <span style="color: #3399cc">-&gt;</span> <span style="color: #cccccc">Result</span> <span style="color: #cccccc">{</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">inner</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.lock();</span>
        <span style="color: #cdcd00">let</span> <span style="color: #cccccc">pl061</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">data.resources().ok_or(Error</span><span style="color: #3399cc">::</span><span style="color: #cccccc">ENXIO)</span><span style="color: #3399cc">?</span><span style="color: #cccccc">;</span>

        <span style="color: #cdcd00">for</span> <span style="color: #cccccc">offset</span> <span style="color: #cccccc">in</span> <span style="color: #cd00cd">0.</span><span style="color: #cccccc">.PL061_GPIO_NR</span> <span style="color: #cccccc">{</span>
            <span style="color: #cdcd00">if</span> <span style="color: #cccccc">inner.csave_regs.gpio_dir</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">bit(offset)</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span> <span style="color: #cccccc">{</span>
                <span style="color: #cdcd00">let</span> <span style="color: #cccccc">value</span> <span style="color: #3399cc">=</span> <span style="color: #cccccc">inner.csave_regs.gpio_data</span> <span style="color: #3399cc">&amp;</span> <span style="color: #cccccc">bit(offset)</span> <span style="color: #3399cc">!=</span> <span style="color: #cd00cd">0</span><span style="color: #cccccc">;</span>
                <span style="color: #cdcd00">let</span> <span style="color: #cccccc">_</span> <span style="color: #3399cc">=</span> <span style="color: #3399cc">&lt;</span><span style="color: #cccccc">Self</span> <span style="color: #cdcd00">as</span> <span style="color: #cccccc">gpio</span><span style="color: #3399cc">::</span><span style="color: #cccccc">Chip</span><span style="color: #3399cc">&gt;::</span><span style="color: #cccccc">direction_output(data,</span> <span style="color: #cccccc">offset.into(),</span> <span style="color: #cccccc">value);</span>
            <span style="color: #cccccc">}</span> <span style="color: #cdcd00">else</span> <span style="color: #cccccc">{</span>
                <span style="color: #cdcd00">let</span> <span style="color: #cccccc">_</span> <span style="color: #3399cc">=</span> <span style="color: #3399cc">&lt;</span><span style="color: #cccccc">Self</span> <span style="color: #cdcd00">as</span> <span style="color: #cccccc">gpio</span><span style="color: #3399cc">::</span><span style="color: #cccccc">Chip</span><span style="color: #3399cc">&gt;::</span><span style="color: #cccccc">direction_input(data,</span> <span style="color: #cccccc">offset.into());</span>
            <span style="color: #cccccc">}</span>
        <span style="color: #cccccc">}</span>

        <span style="color: #cccccc">pl061.base.writeb(inner.csave_regs.gpio_is,</span> <span style="color: #cccccc">GPIOIS);</span>
        <span style="color: #cccccc">pl061.base.writeb(inner.csave_regs.gpio_ibe,</span> <span style="color: #cccccc">GPIOIBE);</span>
        <span style="color: #cccccc">pl061.base.writeb(inner.csave_regs.gpio_iev,</span> <span style="color: #cccccc">GPIOIEV);</span>
        <span style="color: #cccccc">pl061.base.writeb(inner.csave_regs.gpio_ie,</span> <span style="color: #cccccc">GPIOIE);</span>

        <span style="color: #cccccc">Ok(())</span>
    <span style="color: #cccccc">}</span>

    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">freeze(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">)</span> <span style="color: #3399cc">-&gt;</span> <span style="color: #cccccc">Result</span> <span style="color: #cccccc">{</span>
        <span style="color: #cccccc">Self</span><span style="color: #3399cc">::</span><span style="color: #cccccc">suspend(data)</span>
    <span style="color: #cccccc">}</span>

    <span style="color: #cdcd00">fn</span> <span style="color: #cccccc">restore(data</span><span style="color: #3399cc">:</span> <span style="color: #3399cc">&amp;</span><span style="color: #cccccc">Ref</span><span style="color: #3399cc">&lt;</span><span style="color: #cccccc">DeviceData</span><span style="color: #3399cc">&gt;</span><span style="color: #cccccc">)</span> <span style="color: #3399cc">-&gt;</span> <span style="color: #cccccc">Result</span> <span style="color: #cccccc">{</span>
        <span style="color: #cccccc">Self</span><span style="color: #3399cc">::</span><span style="color: #cccccc">resume(data)</span>
    <span style="color: #cccccc">}</span>
<span style="color: #cccccc">}</span>




















<span style="color: #cccccc">module_amba_driver</span><span style="color: #3399cc">!</span> <span style="color: #cccccc">{</span>
    <span style="color: #cdcd00">type</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">PL061Device,</span>
    <span style="color: #cccccc">name</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">b</span><span style="color: #cd0000">&quot;pl061_gpio&quot;</span><span style="color: #cccccc">,</span>
    <span style="color: #cccccc">author</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">b</span><span style="color: #cd0000">&quot;Wedson Almeida Filho&quot;</span><span style="color: #cccccc">,</span>
    <span style="color: #cccccc">license</span><span style="color: #3399cc">:</span> <span style="color: #cccccc">b</span><span style="color: #cd0000">&quot;GPL v2&quot;</span><span style="color: #cccccc">,</span>
<span style="color: #cccccc">}</span>
</pre></td></tr></table></div>



</div>
</body>
</html>

--08cM4rd2G1eCnIF2--

